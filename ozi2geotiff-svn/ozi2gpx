#!/bin/sh

use()
{
cat << _EOF_
Use: $0 <in-ozi-file> <out-gpx-file>
    in-ozi-file     is: *.plt - OziExplorer Track file
                        *.wpt - OziExplorer Waypoint file
                        *.rte - OziExplorer Route file
                        and posible other Ozi files (except *.map)
    out-gpx-file    is *.gpx file
_EOF_
}

if [ -z "$2" ]; then
  use
  exit 1
fi

if [ "$1" == "-h" -o "$1" == "--help" ]; then
  use
  exit 0
fi

in="$1"
out="$2"

gpsbabel -i ozi -f "$in" -o gpx -F "$out"
