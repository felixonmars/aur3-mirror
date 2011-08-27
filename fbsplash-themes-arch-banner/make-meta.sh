#!/bin/bash

# make-cfg.sh                   for fbsplash-themes-arch-banner #
#                                                               #

if [[ $# != [23] ]]; then
	echo "Usage: ${0##*/} <name> <version> [<additional-description>]" >&2
	exit 1
fi

for var in _name _ver _desc; do
	eval $var=\"\$1\"; shift
done

set -e
set -u

_file="${_name}"/metadata.xml

echo "Creating '${_file}'"

mkdir -p "${_name}"

cat > "${_file}" <<EOF
<?xml version="1.0" encoding=\"UTF-8\"?>
<thememeta xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://fbsplash.berlios.de/schemas/1.0/thememeta.xsd">
  <name>${_name}</name>
  <version>${_ver}</version>
  <author>
    <name>Kurt J. Bosch</name>
    <email>kjb-temp-2009 at alpenjodel dot de</name>
  </author>
  <description>Arch Linux banner theme${_desc}</description>
  <license>CCPL:cc-by-nc-sa, Arch Linux Trademarks, Bitstream Vera Fonts Copyright</license>
  <url>http://aur.archlinux.org/packages.php?ID=26966</url>
</thememeta>
EOF

# EOF #
