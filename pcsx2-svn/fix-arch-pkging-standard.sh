#!/bin/sh
#
# Fix plugins and ps2hew.dat directory to comply with Arch Packaging Standards
# * /usr/lib/pcsx2 - plugins directory
# * /usr/share/pcsx2 - application data (ps2hw.dat will go here)
#
# For 64-bit systems, plugins must be at /usr/lib32/pcsx2, because library 
# ELF 32-bit built with multilib must always go stay inside /usr/lib32

fixedlibdir=lib
[ "$1" == "x86_64" ] && fixedlibdir=lib32

for cmakelists in \
	CDVDiso/src/CMakeLists.txt \
	CDVDnull/CMakeLists.txt \
	FWnull/CMakeLists.txt \
	GSdx/CMakeLists.txt \
	PadNull/CMakeLists.txt \
	SPU2null/CMakeLists.txt \
	USBnull/CMakeLists.txt \
	dev9null/CMakeLists.txt \
	onepad/CMakeLists.txt \
	spu2-x/src/CMakeLists.txt \
	zzogl-pg/opengl/CMakeLists.txt
	do
   # lib/games/pcsx2 -> lib{32}/pcsx2
   sed -i -e "/lib\/games\/pcsx2/s/lib\/games/$fixedlibdir/" $cmakelists || exit 1
done
# share/games/pcsx2 -> /share/pcsx2 (fix ps2hw.dat)
sed -i -e '/share\/games\/pcsx2/s/\/games//' $cmakelists || exit 1
