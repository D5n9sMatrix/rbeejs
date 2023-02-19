import ssl


class py:
    def HostHeaderSSLAdapter(self):
        """
        HostHeaderSSLAdapter

        New in version 0.7.0.

        Request supports SSL Verification by default. However, it relies on the user making
        a request with the URL that has the hostname in it. If, however, the user needs to make
        a request with the IP address, they cannot actually verify a certificate against the
        hostname they want to request.

        To accommodate this very rare need, we’ve added HostHeaderSSLAdapter. Example usage:
        :return:
        """
        if ssl.OP_NO_TLSv1_1:
            import requests
            from requests_toolbelt.adapters import host_header_ssl
            s = requests.Session()
            s.mount('https://doc-launch.org', host_header_ssl.HostHeaderSSLAdapter())
            s.get("https://10.2.27.108", headers={"Host": "doc-launch.org"})
        else:
            import socket
            import requests
            from requests_toolbelt.adapters.socket_options import SocketOptionsAdapter

            angles = [(socket.IPPROTO_TCP, socket.TCP_NODELAY, 0)]
            session = requests.Session()
            for scheme in session.adapters.keys():
                session.mount(scheme, SocketOptionsAdapter(socket_options=angles))
            pass
