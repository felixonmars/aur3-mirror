# Maintainer: Sebastian Stuetz <der.stirz[at]gmx.net>
pkgname=frodo
pkgver=4.1b
_version=4_1b
pkgrel=1
epoch=
pkgdesc="A free and portable C64 emulator."
arch=('any')
url="http://frodo.cebix.net/"
license=('freeware')
depends=('sdl')
provides=('frodo')
source=(http://frodo.cebix.net/downloads/FrodoV${_version}.Src.tar.gz)
md5sums=('095b9f21c03204cc13f7f249e8866cd9')
build() {
	mkdir ${pkgdir}/usr
	cd ${pkgdir}/usr
	mkdir share
	mkdir bin
	cd share
	mkdir games
	cd ${srcdir}/Frodo-${pkgver}/Src
	./configure --prefix=/usr/
	make
	rm -r ${srcdir}/Frodo-${pkgver}/Src
	cd ../..
	cp -r ./Frodo-${pkgver} ${pkgdir}/usr/share/games
	cd ${pkgdir}/usr/bin
	touch frodo
       	touch frodopc 
        touch frodosc
       	echo '#!/bin/sh' > frodo
       	echo '#!/bin/sh' > frodopc
       	echo '#!/bin/sh' > frodosc       	
	echo cd /usr/share/games/Frodo-${pkgver} >> frodo
	echo cd /usr/share/games/Frodo-${pkgver} >> frodopc
        echo cd /usr/share/games/Frodo-${pkgver} >> frodosc
        echo ./Frodo >> frodo
	echo ./FrodoPC >> frodopc
        echo ./FrodoSC >> frodosc
	chmod +x frodo
        chmod +x frodopc
        chmod +x frodosc
}

package() {
echo Building package...
}
