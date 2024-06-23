from setuptools import setup
from Cython.Build import cythonize

setup(
    name='CySpark',
    ext_modules = cythonize([
        "Routes/*.pyx",
        "cyspark/*.pyx"
    ]) ,
    packages=['CySpark']
)
