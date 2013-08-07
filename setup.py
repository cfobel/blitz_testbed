#!/usr/bin/env python

from distutils.core import setup, Extension
from Cython.Build import cythonize

blitz_testbed = Extension('blitz_testbed.blitz_testbed',
                      ['blitz_testbed/BlitzTestbed.pyx'],
                      extra_objects=['blitz_testbed/lib/libblitz.a'],
                      language='c++')


setup(name = "blitz_testbed",
    version = "0.0.1",
    description = "Blitz++ Cython test-bed",
    keywords = "Blitz++ blitz cython test",
    author = "Christian Fobel",
    url = "https://github.com/cfobel/blitz_testbed",
    license = "GPL",
    long_description = """""",
    packages = ['blitz_testbed'],

    ext_modules=cythonize([blitz_testbed])
)
