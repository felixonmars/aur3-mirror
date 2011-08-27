#!/bin/sh
LD_LIBRARY_PATH="/opt/sgems/lib:/opt/sgems/plugins/designer:$LD_LIBRARY_PATH" GSTLAPPLIHOME="/opt/sgems" /opt/sgems/bin/sgems "$@"
exit 0


