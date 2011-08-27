# Maintainer: Alex Abbott <smartboyathome@gmail.com>

pkgname=ika
pkgver=0.62
pkgrel=1
pkgdesc="An RPG gaming engine for python." 
arch=(i686 x86_64)
url="http://ika.sourceforge.net" 
license=('GPL')
depends=('python' 'audiere' 'sdl' 'wxgtk' 'corona')
makedepends=('scons')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-src-${pkgver}.tar.bz2)
md5sums=('4a76ac5841343d1fb492bddd8717fe15')

build() { 
	cd $srcdir/src
	echo "Patching Canvas.cpp"
	sed -i -e "s/\#include\ <stdexcept>/\#include\ <stdexcept>\n#include\ <string.h>/g" common/Canvas.cpp
	echo "Patching chr.cpp"
	sed -i -e "s/\#include\ <stdexcept>/\#include\ <stdexcept>\n#include\ <string.h>/g" common/chr.cpp
	echo "Patching fileio.cpp"
	sed -i -e "s/\#include\ <stdio.h>/\#include\ <stdio.h>\n#include\ <string.h>/g" common/fileio.cpp
	echo "Patching fontfile.cpp"
	sed -i -e "s/\#include\ <limits>/\#include\ <limits>\n#include\ <string.h>\n#include\ <memory>/g" common/fontfile.cpp
	echo "Patching vsp.cpp"
	sed -i -e "s/\#include\ <stdio.h>/\#include\ <stdio.h>\n#include\ <string.h>/g" common/vsp.cpp
	echo "Patching SConstruct"
	sed -i -e "s/'\/usr'/'$pkgdir\/usr'/g" SConstruct
	scons
	mkdir -p $pkgdir/usr/bin
	cp engine/ika $pkgdir/usr/bin
}
