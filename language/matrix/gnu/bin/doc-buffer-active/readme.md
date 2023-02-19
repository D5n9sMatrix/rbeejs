# welcome doc-buffer
software doc buffer active microsoft python language

```python
# .
# ├── license
# ├── matrix
# │   └── gnu
# │       ├── bin
# │       │   ├── popup.py
# │       │   ├── pygod.py
# │       │   ├── pyinc.py
# │       │   ├── pyout.py
# │       │   ├── pyvict.py
# │       │   ├── pywater.py
# │       │   └── pywin.py
# │       ├── lib
# │       │   └── pyvec.pyi
# │       └── test
# │           ├── __pycache__
# │           │   └── pyhoney.cpython-310.pyc
# │           └── pyhoney.py
# └── readme.md

```

class io.BufferedWriter(raw, buffer_size=DEFAULT_BUFFER_SIZE)

    A buffered binary stream providing higher-level access to a writeable, non seekable RawIOBase raw binary stream. It inherits BufferedIOBase.

    When writing to this object, data is normally placed into an internal buffer. The buffer will be written out to the underlying RawIOBase object under various conditions, including:

        when the buffer gets too small for all pending data;

        when flush() is called;

        when a seek() is requested (for BufferedRandom objects);

        when the BufferedWriter object is closed or destroyed.

    The constructor creates a BufferedWriter for the given writeable raw stream. If the buffer_size is not given, it defaults to DEFAULT_BUFFER_SIZE.

    BufferedWriter provides or overrides these methods in addition to those from BufferedIOBase and IOBase:

    flush()

        Force bytes held in the buffer into the raw stream. A BlockingIOError should be raised if the raw stream blocks.

    write(b, /)

        Write the bytes-like object, b, and return the number of bytes written. When in non-blocking mode, a BlockingIOError is raised if the buffer needs to be written out but the raw stream blocks.

class io.BufferedRandom(raw, buffer_size=DEFAULT_BUFFER_SIZE)

    A buffered binary stream providing higher-level access to a seekable RawIOBase raw binary stream. It inherits BufferedReader and BufferedWriter.

    The constructor creates a reader and writer for a seekable raw stream, given in the first argument. If the buffer_size is omitted it defaults to DEFAULT_BUFFER_SIZE.

    BufferedRandom is capable of anything BufferedReader or BufferedWriter can do. In addition, seek() and tell() are guaranteed to be implemented.

class io.BufferedRWPair(reader, writer, buffer_size=DEFAULT_BUFFER_SIZE, /)

    A buffered binary stream providing higher-level access to two non seekable RawIOBase raw binary streams—one readable, the other writeable. It inherits BufferedIOBase.

    reader and writer are RawIOBase objects that are readable and writeable respectively. If the buffer_size is omitted it defaults to DEFAULT_BUFFER_SIZE.

    BufferedRWPair implements all of BufferedIOBase's methods except for detach(), which raises UnsupportedOperation.

    Warning

    BufferedRWPair does not attempt to synchronize accesses to its underlying raw streams. You should not pass it the same object as reader and writer; use BufferedRandom instead.

Text I/O

class io.TextIOBase

    Base class for text streams. This class provides a character and line based interface to stream I/O. It inherits IOBase.

    TextIOBase provides or overrides these data attributes and methods in addition to those from IOBase:

    encoding

        The name of the encoding used to decode the stream’s bytes into strings, and to encode strings into bytes.

    errors

        The error setting of the decoder or encoder.

    newlines

        A string, a tuple of strings, or None, indicating the newlines translated so far. Depending on the implementation and the initial constructor flags, this may not be available.

    buffer

        The underlying binary buffer (a BufferedIOBase instance) that TextIOBase deals with. This is not part of the TextIOBase API and may not exist in some implementations.

    detach()

        Separate the underlying binary buffer from the TextIOBase and return it.

        After the underlying buffer has been detached, the TextIOBase is in an unusable state.

        Some TextIOBase implementations, like StringIO, may not have the concept of an underlying buffer and calling this method will raise UnsupportedOperation.

        New in version 3.1.

    read(size=- 1, /)

        Read and return at most size characters from the stream as a single str. If size is negative or None, reads until EOF.

    readline(size=- 1, /)

        Read until newline or EOF and return a single str. If the stream is already at EOF, an empty string is returned.

        If size is specified, at most size characters will be read.

    seek(offset, whence=SEEK_SET, /)

        Change the stream position to the given offset. Behaviour depends on the whence parameter. The default value for whence is SEEK_SET.

            SEEK_SET or 0: seek from the start of the stream (the default); offset must either be a number returned by TextIOBase.tell(), or zero. Any other offset value produces undefined behaviour.

            SEEK_CUR or 1: “seek” to the current position; offset must be zero, which is a no-operation (all other values are unsupported).

            SEEK_END or 2: seek to the end of the stream; offset must be zero (all other values are unsupported).

        Return the new absolute position as an opaque number.

        New in version 3.1: The SEEK_* constants.

    tell()

        Return the current stream position as an opaque number. The number does not usually represent a number of bytes in the underlying binary storage.

    write(s, /)

        Write the string s to the stream and return the number of characters written.

class io.TextIOWrapper(buffer, encoding=None, errors=None, newline=None, line_buffering=False, write_through=False)

    A buffered text stream providing higher-level access to a BufferedIOBase buffered binary stream. It inherits TextIOBase.

    encoding gives the name of the encoding that the stream will be decoded or encoded with. It defaults to locale.getencoding(). encoding="locale" can be used to specify the current locale’s encoding explicitly. See Text Encoding for more information.

    errors is an optional string that specifies how encoding and decoding errors are to be handled. Pass 'strict' to raise a ValueError exception if there is an encoding error (the default of None has the same effect), or pass 'ignore' to ignore errors. (Note that ignoring encoding errors can lead to data loss.) 'replace' causes a replacement marker (such as '?') to be inserted where there is malformed data. 'backslashreplace' causes malformed data to be replaced by a backslashed escape sequence. When writing, 'xmlcharrefreplace' (replace with the appropriate XML character reference) or 'namereplace' (replace with \N{...} escape sequences) can be used. Any other error handling name that has been registered with codecs.register_error() is also valid.

    newline controls how line endings are handled. It can be None, '', '\n', '\r', and '\r\n'. It works as follows:

        When reading input from the stream, if newline is None, universal newlines mode is enabled. Lines in the input can end in '\n', '\r', or '\r\n', and these are translated into '\n' before being returned to the caller. If newline is '', universal newlines mode is enabled, but line endings are returned to the caller untranslated. If newline has any of the other legal values, input lines are only terminated by the given string, and the line ending is returned to the caller untranslated.

        When writing output to the stream, if newline is None, any '\n' characters written are translated to the system default line separator, os.linesep. If newline is '' or '\n', no translation takes place. If newline is any of the other legal values, any '\n' characters written are translated to the given string.

    If line_buffering is True, flush() is implied when a call to write contains a newline character or a carriage return.

    If write_through is True, calls to write() are guaranteed not to be buffered: any data written on the TextIOWrapper object is immediately handled to its underlying binary buffer.

    Changed in version 3.3: The write_through argument has been added.

    Changed in version 3.3: The default encoding is now locale.getpreferredencoding(False) instead of locale.getpreferredencoding(). Don’t change temporary the locale encoding using locale.setlocale(), use the current locale encoding instead of the user preferred encoding.

    Changed in version 3.10: The encoding argument now supports the "locale" dummy encoding name.

    TextIOWrapper provides these data attributes and methods in addition to those from TextIOBase and IOBase:

    line_buffering

        Whether line buffering is enabled.

    write_through

        Whether writes are passed immediately to the underlying binary buffer.

        New in version 3.7.

    reconfigure(*, encoding=None, errors=None, newline=None, line_buffering=None, write_through=None)

        Reconfigure this text stream using new settings for encoding, errors, newline, line_buffering and write_through.

        Parameters not specified keep current settings, except errors='strict' is used when encoding is specified but errors is not specified.

        It is not possible to change the encoding or newline if some data has already been read from the stream. On the other hand, changing encoding after write is possible.

        This method does an implicit stream flush before setting the new parameters.

        New in version 3.7.

        Changed in version 3.11: The method supports encoding="locale" option.

class io.StringIO(initial_value='', newline='\n')

    A text stream using an in-memory text buffer. It inherits TextIOBase.

    The text buffer is discarded when the close() method is called.

    The initial value of the buffer can be set by providing initial_value. If newline translation is enabled, newlines will be encoded as if by write(). The stream is positioned at the start of the buffer which emulates opening an existing file in a w+ mode, making it ready for an immediate write from the beginning or for a write that would overwrite the initial value. To emulate opening a file in an a+ mode ready for appending, use f.seek(0, io.SEEK_END) to reposition the stream at the end of the buffer.

    The newline argument works like that of TextIOWrapper, except that when writing output to the stream, if newline is None, newlines are written as \n on all platforms.

    StringIO provides this method in addition to those from TextIOBase and IOBase:

    getvalue()

        Return a str containing the entire contents of the buffer. Newlines are decoded as if by read(), although the stream position is not changed.

    Example usage:

    import io

    output = io.StringIO()
    output.write('First line.\n')
    print('Second line.', file=output)

    # Retrieve file contents -- this will be
    # 'First line.\nSecond line.\n'
    contents = output.getvalue()

    # Close object and discard memory buffer --
    # .getvalue() will now raise an exception.
    output.close()

class io.IncrementalNewlineDecoder

    A helper codec that decodes newlines for universal newlines mode. It inherits codecs.IncrementalDecoder.

Performance

This section discusses the performance of the provided concrete I/O implementations.
Binary I/O

By reading and writing only large chunks of data even when the user asks for a single byte, buffered I/O hides any inefficiency in calling and executing the operating system’s unbuffered I/O routines. The gain depends on the OS and the kind of I/O which is performed. For example, on some modern OSes such as Linux, unbuffered disk I/O can be as fast as buffered I/O. The bottom line, however, is that buffered I/O offers predictable performance regardless of the platform and the backing device. Therefore, it is almost always preferable to use buffered I/O rather than unbuffered I/O for binary data.
Text I/O

Text I/O over a binary storage (such as a file) is significantly slower than binary I/O over the same storage, because it requires conversions between unicode and binary data using a character codec. This can become noticeable handling huge amounts of text data like large log files. Also, TextIOWrapper.tell() and TextIOWrapper.seek() are both quite slow due to the reconstruction algorithm used.

StringIO, however, is a native in-memory unicode container and will exhibit similar speed to BytesIO.
Multi-threading

FileIO objects are thread-safe to the extent that the operating system calls (such as read(2) under Unix) they wrap are thread-safe too.

Binary buffered objects (instances of BufferedReader, BufferedWriter, BufferedRandom and BufferedRWPair) protect their internal structures using a lock; it is therefore safe to call them from multiple threads at once.

TextIOWrapper objects are not thread-safe.
Reentrancy

Binary buffered objects (instances of BufferedReader, BufferedWriter, BufferedRandom and BufferedRWPair) are not reentrant. While reentrant calls will not happen in normal situations, they can arise from doing I/O in a signal handler. If a thread tries to re-enter a buffered object which it is already accessing, a RuntimeError is raised. Note this doesn’t prohibit a different thread from entering the buffered object.

The above implicitly extends to text files, since the open() function will wrap a buffered object inside a TextIOWrapper. This includes standard streams and therefore affects the built-in print() function as well.
