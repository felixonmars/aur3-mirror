#!/bin/bash
defaultvmddir="/usr/lib/vmd"
vmdbasename=vmd

############################################################################
#cr                                                                       
#cr            (C) Copyright 1995-2006 The Board of Trustees of the          
#cr                        University of Illinois                         
#cr                         All Rights Reserved                           
#cr                                                                       
############################################################################

############################################################################
# RCS INFORMATION:
#
#       $RCSfile: vmd,v $
#       $Author: johns $        $Locker:  $                $State: Exp $
#       $Revision: 1.77 $      $Date: 2006/01/05 00:03:27 $
#
############################################################################
# DESCRIPTION:
#
# csh script to start up vmd, using an xterm-like window for the console
#
############################################################################

#
# User configurable/overridable default settings.
#

if [ "$VMDDIR" = "" ]; then
  export VMDDIR="$defaultvmddir"
fi

if [ "$MASTERVMDDIR" = "" ]; then
  export MASTERVMDDIR="$defaultvmddir"
fi

if [ "$VMDDISPLAYDEVICE" = "" ]; then
  export VMDDISPLAYDEVICE="win"
fi

# This allows VMD to use the Spaceball 6DOF as an additional input device.
#export VMDSPACEBALLPORT="/dev/ttyS1"

if [ "$PYTHONPATH" = "" ]; then
  export PYTHONPATH="$VMDDIR/scripts/python"
else
  export PYTHONPATH="$PYTHONPATH/:$VMDDIR/scripts/python"
fi

export TCL_LIBRARY="$VMDDIR/scripts/tcl"

if [ -f "/usr/bin/babel" ]; then
  export VMDBABELBIN="/usr/bin/babel"
fi

# Stride -- used to generate cartoon representations etc.
if [ -f "$MASTERVMDDIR/stride_LINUX" ]; then
  export STRIDE_BIN="$VMDDIR/stride_LINUX"
fi

# Surf -- used to generate molecular surfaces
if [ -f "$MASTERVMDDIR/surf_LINUX" ]; then
  export SURF_BIN="$VMDDIR/surf_LINUX"
fi

# Tachyon -- used to generate ray traced graphics
if [ -f "$MASTERVMDDIR/tachyon_LINUX" ]; then
  export TACHYON_BIN="$VMDDIR/tachyon_LINUX"
fi

# Launch VMD
xterm -T "vmd console" -fn '-misc-fixed-medium-r-normal--13-120-75-75-c-80-iso8859-15' -geometry 80x20-0-0 -sb -sl 1000 -e "$MASTERVMDDIR"/vmd_LINUX $* 2>/dev/null &
