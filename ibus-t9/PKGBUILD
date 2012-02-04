# Author: microcai <microcaicai@gmail.com>
# Maintainer: Yangtse <yangtsesu@gmail.com> 

pkgname=ibus-t9
pkgver=2.1.0.20100601
pkgrel=1
pkgdesc="T9 input method for ibus"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ibus-t9"
license=('GPL')
depends=('ibus')
source=(http://ibus-t9.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${pkgdir} install
}

md5sums=('ca04f1f570dbde8997c2c1e161ecbd86')
