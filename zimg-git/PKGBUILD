# Maintainer: FX-Ti <zjxiang1998@gmail.com>

pkgname=zimg-git
pkgver=1.0.0
pkgrel=3
pkgdesc="A light and high performance image storage and processing system written by C."
arch=('i686' 'x86_64')
url="http://zimg.buaa.us"
license=('BSD')
depends=('libevhtp'
	'imagemagick'
	'libmemcached')
makedepends=('git' 'make')
optdepends=('memcached: BackEnd Fast I/O database Support')


build() {
	git clone https://github.com/buaazp/zimg.git
	cd zimg
	cmake . || return 1
	make -j3 || return 1
	rm *.c *.h
}

package(){
	cd ${srcdir}/zimg
	mkdir -p ${pkgdir}/usr/share/zimg
	cp -r * ${pkgdir}/usr/share/zimg
	mkdir -p ${pkgdir}/usr/bin
	ln -s ./zimg ${pkgdir}/usr/bin/zimg 
}

