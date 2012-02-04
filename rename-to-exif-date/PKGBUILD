# Author: Raul Gonzalez Duque <zootropo@gmail.com>
# Contributor: Xi0N <grayfox.i0n@gmail.com>
pkgname=rename-to-exif-date
pkgver=0.1.0
pkgrel=2
pkgdesc="Rename the photos dropped on the window to the date and hour in which they were taken."
arch=('any')
url="http://mundogeek.net/rename-to-exif-date/"
license=(GPL)
depends=('python') 
source=(http://launchpadlibrarian.net/17370687/${pkgname}_$pkgver-2.tar.gz)
md5sums=('197be517220a4eb29e617625af254292')

build() { 
	cd "${srcdir}/${pkgname}-${pkgver}/"
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
              -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
              $(find ./ -name '*.py')

	sed -i "s|import EXIF|import exif|" rename-to-exif-date.py
    sed -i "s|python|python2|" rename-to-exif-date 
	make install DESTDIR=$pkgdir || return 1
}
