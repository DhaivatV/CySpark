from setuptools import setup
from Cython.Build import cythonize

setup(
    name='CySpark',
    ext_modules = cythonize([
        "Routes/*.pyx",
    ]) ,
    packages=['CySpark']
)
