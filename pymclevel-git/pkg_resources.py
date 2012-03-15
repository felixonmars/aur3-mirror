#!/usr/bin/env python2
# Provides default "root" path for pymclevel classes

import os

PATH = "/usr/share/pymclevel"

def resource_stream(whatever_this_is, filename):
	return file(os.path.join(PATH, filename), "rb")
