from distutils.core import setup
from distutils.extension import Extension

setup(name="PyNoise",
      version="0.2",
      url="http://home.gna.org/pynoise/",
      ext_modules=[Extension("_libnoise", ["libnoise.i", "noiseutils.cpp"], include_dirs=['/usr/include/noise'], libraries = ["noise"])],
      py_modules=["libnoise"],
      )
