export YACS_ROOT_DIR=/opt/salome/yacs

_paraview_pythonpath="/usr/lib/paraview-4.1/site-packages/:/usr/lib/paraview-4.1/site-packages/vtk"
if [[ $PYTHONPATH != *${_paraview_pythonpath}* ]]; then
  export PYTHONPATH=${_paraview_pythonpath}:$PYTHONPATH
fi
export PYTHONPATH=$YACS_ROOT_DIR/lib/python2.7/site-packages/salome:$PYTHONPATH

_paraview_librarypath="/usr/lib/paraview-4.1"
if [[ $LD_LIBRARY_PATH != *${_paraview_librarypath}* ]]; then
  export LD_LIBRARY_PATH=${_paraview_librarypath}:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH=$YACS_ROOT_DIR/lib/salome:$LD_LIBRARY_PATH

export PATH=$YACS_ROOT_DIR/bin/salome:$PATH