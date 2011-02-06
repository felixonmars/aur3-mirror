#!/usr/bin/env python

from distutils.core import setup

setup(name = "quasi",
      version = "0.87",
      description = "A multiple-context Python shell",
      author = "Ben Last",
      author_email = "ben@benlast.com",
      url = "http://quasi-shell.sourceforge.net/",
      license = "BSD",
      scripts = ["quasi.py"],
      data_files = [("share/licenses/quasi", ["LICENSE"])],
      extra_path = "quasi",
      packages = ["."]
      )
