from setuptools import setup
from Cython.Build import cythonize

setup(
    name='CySpark',
    ext_modules = cythonize([
        "Routes/*.pyx",
        "server_conf/*.pyx"
    ]) ,
    packages=['CySpark']
)
