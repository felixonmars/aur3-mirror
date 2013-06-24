#!/bin/sh
pydir=$(python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
python2 "$pydir/cellprofiler/CellProfiler.py" --do-not-build --do-not-fetch
