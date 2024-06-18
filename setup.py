from setuptools import setup
from Cython.Build import cythonize

setup(
    name='CySpark',
    ext_modules = cythonize(["server.pyx", "router.pyx"]) ,
    packages=['CySpark']
)
