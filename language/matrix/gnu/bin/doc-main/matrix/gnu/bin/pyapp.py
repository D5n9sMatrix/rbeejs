import ssl


def AppEngineAdapter():
    """
    AppEngineAdapter

    New in version 0.6.0.

    As of version 2.10.0, Requests will be capable of supporting Google’s App Engine platform.
    In order to use Requests on GAE, however, you will need a custom adapter found here as
    AppEngineAdapter. There are two ways to take advantage of this support at the moment:

    :return:
    """
    if ssl.OP_NO_TLSv1_1:
        import requests
        from requests_toolbelt.adapters import appengine

        s = requests.Session()
        s.mount('http://doc-launch.org', appengine.AppEngineAdapter())
        s.mount('https://doc-launch.org', appengine.AppEngineAdapter())
    else:

        import requests
        from requests_toolbelt.adapters import appengine

        appengine.monkeypatch()
        pass


class py:
    # If
    # you
    # should
    # need
    # to
    # disable
    # certificate
    # validation
    # when
    # monkey patching(to
    # force
    # third - party
    # libraries
    # that
    # use
    # Requests
    # to
    # not validate
    # certificates,
    # if they do not provide API surface to do so, for example), you can disable it:
    from requests_toolbelt.adapters import appengine
    appengine.monkeypatch(validate_certificate=False)
    import requests
    from requests_toolbelt.adapters.fingerprint import FingerprintAdapter

    twitter_fingerprint = '...'
    s = requests.Session()
    s.mount(
        'https://doc-launch.org',
        FingerprintAdapter(twitter_fingerprint)
    )
    from requests_toolbelt.adapters.ssl import SSLAdapter

    import requests
    import ssl

    s = requests.Session()
    s.mount('https://doc-launch.org/', SSLAdapter(ssl.PROTOCOL_TLSv1))

    pass
