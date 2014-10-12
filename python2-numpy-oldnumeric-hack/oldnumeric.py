# Offer numarray module as numpy.oldnumeric - a workaraound for
# https://bugs.archlinux.org/task/42054: "wx-3.0-gtk2/wx/lib/plot.py fails
# to import numpy.oldnumeric".

import sys
import numarray
sys.modules["numpy"].oldnumeric = numarray
sys.modules["numpy.oldnumeric"] = numarray

