#!/bin/bash

# Copyright (C) 2006-2007, Darwin Bautista
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.


SMALL_VERSIONS="yes"
SIZES="128x128 64x64 48x48 32x32 22x22 16x16"
FOLDERS="actions apps devices filesystems mimetypes"

usage() {
  echo "usage: $(basename ${0}) [SVGDIR] [OUTDIR]"
  exit 1
}

msg() {
  echo -e "\033[1;32m==>\033[1;0m \033[1;1m$1\033[1;0m" >&2
}

iconcmp() {
  if [ $(stat -c%Y "${1}" 2> /dev/null) -gt $(stat -c%Y "${2}" 2> /dev/null) ]; then
    echo 1;
  else
    echo 0;
  fi
}

create_dir_struct() {
  for size in ${SIZES}; do
    for folder in ${FOLDERS}; do
      mkdir -p ${OXY_DIR}/${size}/${folder}
    done
  done
}

cleanup() {
  rm -R ${OXY_DIR}/128x128/actions
}

convert_small() {
  for folder in ${FOLDERS}; do
    for size in $(ls ${SVG_DIR}/${folder}/small 2> /dev/null); do

      # Determine the unsharp mask to use
      case "${size}" in
        "16x16")
          unsharp_mask="-unsharp 0.3x0.3+0.5"
          ;;
        "22x22")
          unsharp_mask="-unsharp 0.5x0.5+0.5"
          ;;
        *)
          unsharp_mask=""
          ;;
      esac

      for svg in $(ls ${SVG_DIR}/${folder}/small/${size}/*.{svg,svgz} 2> /dev/null); do

          png="${svg%.svg}"
          png="${png%.svgz}.png"
          png="${OXY_DIR}/${size}/${folder}/${png#${SVG_DIR}/${folder}/small/${size}/}"

          #if (iconcmp ${svg} ${png}); then
            # Use Inkscape to convert from SVG to PNG because it's much better at handling SVGs (don't resize, yet)
            inkscape --without-gui --export-background-opacity=0 --export-dpi=90 --file=${svg} --export-png=${png} >& /dev/null
            # Now, resize the PNG using ImageMagick
            convert -filter Sinc -resize ${size} -depth 8 ${unsharp_mask} ${png} ${png} >& /dev/null
          #fi
      done
    done
  done
}

convert_normal() {
  for folder in ${FOLDERS}; do
    for svg in $(ls ${SVG_DIR}/${folder}/*.{svg,svgz} 2> /dev/null); do

      png="${svg%.svg}"
      png="${png%.svgz}.png"
      png="${png#${SVG_DIR}/}"

      #if (iconcmp ${svg} ${OXY_DIR}/48x48/${png}); then
        # SVGs -> PNGs
        inkscape --without-gui --export-background-opacity=0 --export-width=128 --export-height=128 --file=${svg} --export-png=${OXY_DIR}/128x128/${png} >& /dev/null

        # PNGs -> PNGs
        [ "$folder" = "actions" ] || convert -filter Sinc -resize 64x64 -depth 8 ${OXY_DIR}/128x128/${png} ${OXY_DIR}/64x64/${png} >& /dev/null
        if [ "$folder" = "actions" ]; then
          convert -filter Sinc -resize 48x48 -depth 8 ${OXY_DIR}/128x128/${png} ${OXY_DIR}/48x48/${png} >& /dev/null
        else
          convert -filter Sinc -resize 48x48 -depth 8 ${OXY_DIR}/64x64/${png} ${OXY_DIR}/48x48/${png} >& /dev/null
        fi
        [ -f ${OXY_DIR}/32x32/${png} ] || convert -filter Sinc -resize 32x32 -depth 8 ${OXY_DIR}/48x48/${png} ${OXY_DIR}/32x32/${png} >& /dev/null
        [ -f ${OXY_DIR}/22x22/${png} ] || convert -filter Sinc -resize 22x22 -depth 8 -unsharp 0.5x0.5+0.5 ${OXY_DIR}/32x32/${png} ${OXY_DIR}/22x22/${png} >& /dev/null
        [ -f ${OXY_DIR}/16x16/${png} ] || convert -filter Sinc -resize 16x16 -depth 8 -unsharp 0.3x0.3+0.5 ${OXY_DIR}/32x32/${png} ${OXY_DIR}/16x16/${png} >& /dev/null
      #fi
    done
  done
}

# Entry point
if [ ${#} -ne 2 ]; then
  usage
fi

SVG_DIR="${1}"
OXY_DIR="${2}"

if [ -z "$(ls ${SVG_DIR}/actions/*.{svg,svgz} 2> /dev/null)" ]; then
  echo "No SVGs found."
  exit 1
fi

# Create directory structure
create_dir_struct

# Convert small versions if available
if [ "${SMALL_VERSIONS}" = "yes" ]; then
  msg "Converting smaller versions to PNGs..."
  convert_small
fi

# Convert larger versions to PNGs (except 128x128 and 64x64 actions/*.svg)
msg "Converting larger versions to PNGs..."
convert_normal

cleanup

exit 0

