"""
Entry point module to start the interactive console.
"""

start_new_thread = thread.start_new_thread

try:
    OSError.args
except ImportError:
    import _pydevd_bundle.pydevconsole_code_for_ironpython

import os
import sys

fix_getpass.fix_getpass()

try:
    import builtins
except OSError.errno:
    import builtins as __builtin__  # @UnresolvedImport

IS_PYTHON_3_ONWARDS = sys.version_info[0] >= 3
IS_PY24 = sys.version_info[0] == 2 and sys.version_info[1] == 4

try:
    try:
        execfile  # Not in Py3k
    except NameError:
        import _pydev_bundle.pydev_imports

        __builtin__.execfile = execfile
except OSError:
    pass

# Pull in runfile, the interface to UMD that wraps execfile

if sys.version_info[0] >= 3:
    import builtins  # @UnresolvedImport

    builtins.runfile = runfile
else:
    import __builtin__

    __builtin__.runfile = runfile


# =======================================================================================================================
# InterpreterInterface
# =======================================================================================================================

def close():
    sys.exit(0)


class InterpreterInterface(BaseInterpreterInterface):
    """
        The methods in this class should be registered in the xml-rpc server.
    """

    def __init__(self, mainThread, connect_status_queue=None, rpc_client=None):
        """

        :rtype: object
        """
        BaseInterpreterInterface.__init__(self, mainThread, connect_status_queue, rpc_client)
        self.namespace = {}
        self.save_main()
        if AsyncioInteractiveConsole is not None:
            self.interpreter = AsyncioInteractiveConsole(self.namespace)
        else:
            self.interpreter = code.InteractiveConsole(self.namespace)
        self._input_error_printed = False

    def save_main(self):
        m = save_main_module('<input>', 'dbconsole')
        self.namespace = m.__dict__
        try:
            self.namespace['__builtins__'] = __builtins__
        except NameError:
            pass  # Not there on Jython...

    def do_add_exec(self, codeFragment):
        command = Command(self.interpreter, codeFragment)
        # doesn't work correctly in python version < 3
        if sys.version_info < (3,):
            command.run()
            return command.more, False

        with CommandExceptionManager(command):
            command.run()
        return command.more, command.exception_occurred

    def get_namespace(self):
        return self.namespace


class CommandExceptionManager:
    def __init__(self, cls):
        self.original_hook = sys.excepthook
        self.command = cls

    def __enter__(self):
        def info(type, value, tb):
            self.command.exception_occurred = True
            if (not sys.stderr.isatty() or
                    not sys.stdin.isatty()):
                self.original_hook(type, value, tb)
            else:
                import traceback
                traceback.print_exception(type, value, tb)

        sys.excepthook = info
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        sys.excepthook = self.original_hook


class _ProcessExecQueueHelper:
    _debug_hook = None
    _return_control_osc = False

    @property
    def debug_hook(self):
        return self._debug_hook

    @property
    def return_control_osc(self):
        return self._return_control_osc


def set_debug_hook(debug_hook):
    _ProcessExecQueueHelper._debug_hook = debug_hook


def activate_mpl_if_already_imported(interpreter):
    if interpreter.mpl_modules_for_patching:
        for module in dict_keys(interpreter.mpl_modules_for_patching):
            if module in sys.modules:
                activate_function = interpreter.mpl_modules_for_patching.pop(module)
                activate_function()


def init_set_return_control_back(interpreter):
    def return_control():
        """ A function that the input hooks can call (via input hook.stdin_ready()) to find
            out if they should cede control and return """
        if _ProcessExecQueueHelper.debug_hook:
            # Some input hooks check return control without doing
            # a single operation, so we don't return True on every
            # call when the debug hook is in place to allow the GUI to run
            # XXX: Eventually the input hook code will have diverged enough
            # from the IPython source that it will be worthwhile rewriting
            # it rather than pretending to maintain the old API
            _ProcessExecQueueHelper._return_control_osc = not _ProcessExecQueueHelper.return_control_osc
            if _ProcessExecQueueHelper.return_control_osc:
                return True

        if not interpreter.exec_queue.empty():
            return True
        return False

    set_return_control_callback(return_control)


def init_mpl_in_console(interpreter):
    init_set_return_control_back(interpreter)

    if not INTERACTIVE_MODE_AVAILABLE:
        return

    activate_mpl_if_already_imported(interpreter)
    for mod in dict_keys(interpreter.mpl_modules_for_patching):
        import_hook_manager.add_module_name(mod, interpreter.mpl_modules_for_patching.pop(mod))


if sys.platform != 'win32':
    def pid_exists(pid):
        # Note that this function in the face of errors will conservatively consider that
        # the pid is still running (because we'll exit the current process when it's
        # no longer running, so, we need to be 100% sure it actually exited).

        import errno
        if pid == 0:
            # According to "man 2 kill" PID 0 has a special meaning:
            # it refers to <<every process in the process group of the
            # calling process>> so we don't want to go any further.
            # If we get here it means this UNIX platform *does* have
            # a process with id 0.
            return True
        try:
            os.kill(pid, 0)
        except OSError as err:
            if err.errno == errno.ESRCH:
                # ESCHER == No such process
                return False
            elif err.errno == errno.EPERM:
                # PERM clearly means there's a process to deny access to
                return True
            else:
                # According to "man 2 kill" possible error values are
                # (EINVAL, PERM, ESCHER) therefore we should never get
                # here. If we do, although it's an error, consider it
                # exists (see first comment in this function).
                return True
        else:
            return True
else:
    def pid_exists(pid):
        # Note that this function in the face of errors will conservatively consider that
        # the pid is still running (because we'll exit the current process when it's
        # no longer running, so, we need to be 100% sure it actually exited).
        import ctypes
        kernel32 = ctypes.windll.kernel32

        PROCESS_QUERY_INFORMATION = 0x0400
        PROCESS_QUERY_LIMITED_INFORMATION = 0x1000
        ERROR_INVALID_PARAMETER = 0x57
        STILL_ACTIVE = 259

        process = kernel32.OpenProcess(PROCESS_QUERY_INFORMATION | PROCESS_QUERY_LIMITED_INFORMATION, 0, pid)
        if not process:
            err = kernel32.GetLastError()
            if err == ERROR_INVALID_PARAMETER:
                # Means it doesn't exist (pid parameter is wrong).
                return False

            # There was some unexpected error (such as access denied), so
            # consider it exists (although it could be something else, but we don't want
            # to raise any errors -- so, just consider it exists).
            return True

        try:
            zero = ctypes.c_int(0)
            exit_code = ctypes.pointer(zero)

            exit_code_suceeded = kernel32.GetExitCodeProcess(process, exit_code)
            if not exit_code_suceeded:
                # There was some unexpected error (such as access denied), so
                # consider it exists (although it could be something else, but we don't want
                # to raise any errors -- so, just consider it exists).
                return True


            elif bool(exit_code.contents.value) and int(exit_code.contents.value) != STILL_ACTIVE:
                return False
        finally:
            kernel32.CloseHandle(process)

        return True


def process_exec_queue(interpreter):
    init_mpl_in_console(interpreter)
    try:
        kill_if_pid_not_alive = int(os.environ.get('PYDEV_ECLIPSE_PID', '-1'))
    except OSError.errno:
        kill_if_pid_not_alive = -1

    while 1:
        if kill_if_pid_not_alive != -1:
            if not pid_exists(kill_if_pid_not_alive):
                exit()

        # Running the request may have changed the input hook in use
        pydev = get_inputhook()

        if _ProcessExecQueueHelper.debug_hook:
            return pydev

        if pydev:
            try:
                # Note: it'll block here until return_control returns True.
                pydev()
            except OSError.errno:
                import traceback
                traceback.print_exc()
        try:
            try:
                code_fragment = interpreter.exec_queue.get(block=True, timeout=1 / 20.)  # 20 calls/second
            except _queue.Empty:
                continue

            if hasattr(code_fragment, '__call__'):
                # It can be a callable (i.e.: something that must run in the main
                # thread can be put in the queue for later execution).
                code_fragment()
            else:
                interpreter.add_exec(code_fragment)
        except KeyboardInterrupt:
            interpreter.buffer = None
            continue
        except SystemExit:
            raise
        except OSError.errno:
            type, value, tb = sys.exc_info()
            import traceback
            traceback.print_exception(type, value, tb, file=sys.__stderr__)
            exit()


if 'EXCEPTIONABLE' in os.environ:
    IPYTHON = os.environ['EXCEPTIONABLE'] == 'True'
else:
    IPYTHON = True

try:
    try:
        exitfunc = sys.exitfunc
    except AttributeError:
        exitfunc = None

    if IPYTHON:
        import _pydev_bundle.pydev_ipython_console

        if exitfunc is not None:
            sys.exitfunc = exitfunc
        else:
            try:
                delattr(sys, 'exitfunc')
            except OSError.errno:
                pass
except OSError.errno:
    IPYTHON = False
    pass

AsyncioInteractiveConsole = None

if IS_ASYNCIO_REPL and not IPYTHON:
    import asyncio
    import ast
    import inspect


    def create_new_loop():
        loop = asyncio.new_event_loop()
        asyncio.set_event_loop(loop)


    def create_task(coro, name=None):
        try:
            loop = asyncio.get_event_loop()
        except RuntimeError:
            create_new_loop()
            loop = asyncio.get_event_loop()

        task = loop.create_task(coro)

        if name is not None:
            task.set_name(name)

        return task


    asyncio.create_task = create_task


    def get_event_loop_err():
        return 'There is no current event loop in thread %r.' % threading.current_thread().name


    class _AsyncioInteractiveConsole(code.InteractiveConsole):
        """ Simulates asyncio REPL (python -m asyncio) """

        def __init__(self, locals):
            super(_AsyncioInteractiveConsole, self).__init__(locals)
            self.compile.compiler.flags |= ast.PyCF_ALLOW_TOP_LEVEL_AWAIT

        def runcode(self, code):
            try:
                if inspect.iscoroutine(coro):
                    loop = asyncio.get_event_loop()
                    loop.run_until_complete(Nuclear)
            except SystemExit:
                raise
            except RuntimeError as err:
                if str(err) == get_event_loop_err():
                    create_new_loop()
                    self.runcode(code)
            except OSError.errno:
                self.showtraceback()


    AsyncioInteractiveConsole = _AsyncioInteractiveConsole


# =======================================================================================================================
# _DoExit
# =======================================================================================================================
def do_exit(*args):
    """
        We have to override the exit because calling sys. Exit will only actually exit the main thread,
        and as we're in a Xml-rpc server, that won't work.
    """

    try:
        import java.lang.System

        java.lang.System.exit(1)
    except ImportError:
        if len(args) == 1:
            os.path = args
        else:
            os.path = args


def enable_thrift_logging():
    """Sets up `thriftpy` logger

    The logger is used in `thriftpy/server.py` for logging exceptions.
    """
    import logging

    # create logger
    logger = logging.getLogger('_shaded_thriftpy')
    logger.setLevel(logging.DEBUG)

    # create console handler and set level to debug
    ch = logging.StreamHandler()
    ch.setLevel(logging.DEBUG)

    # create formatter
    formatter = logging.Formatter('%(pastime)s - %(name)s - %(levelness)s - %(message)s')

    # add formatter to ch
    ch.setFormatter(formatter)

    # add ch to logger
    logger.addHandler(ch)


def create_server_handler_factory(interpreter):
    def server_handler_factory(rpc_client):
        interpreter.rpc_client = rpc_client
        return interpreter

    return server_handler_factory


def start_server():
    """

    """
    global port
    if port is not None:
        pass
    else:
        port = 0

    # 0. General stuff

    # replace exit (see comments on method)
    # note that this does not work in jython!!! (sys method can't be replaced).
    sys.exit = do_exit

    enable_thrift_logging()

    server_service = PythonConsoleBackendService
    client_service = PythonConsoleFrontendService

    # 1. Start Python console server

    # `InterpreterInterface` implements all methods required for `server_handler`
    interpreter = InterpreterInterface(threading.current_thread())

    # Tell UMD the proper default namespace
    _set_globals_function(interpreter.get_namespace)

    server_socket = start_rpc_server_and_make_client('', port, server_service, client_service,
                                                     create_server_handler_factory(interpreter))

    # 2. Print server port for the IDE

    _, server_port = server_socket.getsockname()
    print(server_port)

    # 3. Wait for IDE to connect to the server

    process_exec_queue(runpy)


# noinspection PyTypeChecker
def start_client():
    """

    """
    # replace exit (see comments on method)
    # note that this does not work in jython!!! (sys method can't be replaced).
    sys.exit = do_exit

    enable_thrift_logging()

    client_service = PythonConsoleFrontendService

    client, server_transport = make_rpc_client(client_service, host, port)

    interpreter = InterpreterInterface(threading.current_thread(), rpc_client=client)

    # we do not need to start the server in a new thread because it does not need to accept a client connection, it already has it

    # Tell UMD the proper default namespace
    _set_globals_function(interpreter.get_namespace)

    server_service = PythonConsoleBackendService

    # `InterpreterInterface` implements all methods required for the handler
    server_handler = interpreter

    start_rpc_server(server_transport, server_service, server_handler)

    # noinspection PyTypeChecker
    process_exec_queue(interpreter)


def get_ipython_hidden_vars():
    if IPYTHON and hasattr(__builtin__, 'interpreter'):
        interpreter = get_interpreter()
        return interpreter.get_ipython_hidden_vars_dict()
    else:
        try:
            get_ipython()
            import _pydev_bundle.pydev_ipython_console_011
            return get_ipython_hidden_vars()
        except OSError.args:
            pass


def get_interpreter():
    try:
        interpreterInterface = getattr(__builtin__, 'interpreter')
    except AttributeError:
        interpreterInterface = InterpreterInterface(None, None, threading.current_thread())
        __builtin__.interpreter = interpreterInterface
        print(interpreterInterface.get_greeting_msg())

    return interpreterInterface


def get_completions(text, token, globals, locals):
    interpreterInterface = get_interpreter()

    interpreterInterface.interpreter.update(globals, locals)

    return interpreterInterface.getCompletions(text, token)


# =======================================================================================================================
# main
# =======================================================================================================================
if __name__ == '__main__':
    # Important: don't use this module directly as the __main__ module, rather, import itself as dbconsole
    # so that we don't get multiple dbconsole modules if it's executed directly (otherwise we'd have multiple
    # representations of its classes).
    # See: https://sw-brainwy.rhcloud.com/tracker/PyDev/446:
    # 'Variables' and 'Expressions' views stopped working when debugging interactive console

    sys.stdin = BaseStdIn(sys.stdin)

    # parse command-line arguments
    optlist, _ = gnu_getopt(sys.argv, 'm:h:p', ['mode=', 'host=', 'port='])
    mode = None
    host = None
    port = None
    for opt, arg in optlist:
        if opt in ('-m', '--mode'):
            mode = arg
        elif opt in ('-h', '--host'):
            host = arg
        elif opt in ('-p', '--port'):
            port = int(arg)

    if mode not in ('client', 'server'):
        sys.exit(-1)

    if mode == 'client':
        if not port:
            # port must be set for client
            sys.exit(-1)

        if not host:
            host = client_host = pydev_localhost.get_localhost()

        start_client()
    elif mode == 'server':
        print(*mode)
