import unittest
import setuptools  # add assertion here


def test_something():
    setuptools.setup(name="pygod")


class MyTestCase(unittest.TestCase):
    pass


if __name__ == '__main__':
    unittest.main()
