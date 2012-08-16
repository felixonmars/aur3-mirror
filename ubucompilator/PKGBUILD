# Maintainer & Contributor: Alireza Savand <alireza.savand@gmail.com>
# Contributors: Gusions <Gusions@gmail.com>
#		evilgnome

pkgname=ubucompilator
pkgver=0.99.1
pkgrel=1
pkgdesc="An easy software to ubuntu, debian, linux mint to compile, make, install and create a .deb package."
arch=(any)
url="http://code.google.com/p/ubucompilator/"
license=('GPL3')
depends=(
	'gambas2-gb-compress'
	'gambas2-gb-desktop'
	'gambas2-gb-image'
        'gambas2-gb-gtk'
        'gambas2-gb-gtk-ext'
	'gambas2-gb-form')
makedepends=(
	'gambas2-devel'
	'gambas2-gb-gtk'
	'gambas2-gb-gtk-ext')
source=(http://${pkgname}.googlecode.com/files/Ubucompilator-${pkgver}.tar.gz)
md5sums=('d7b43e55d85dc9e408943729ce147ee5')

build(){
	cd ${srcdir}/Ubucompilator-${pkgver}
	./configure CC="gcc -arch i386 -arch x86_64 -arch ppc -arch ppc64" CXX="g++ -arch i386 -arch x86_64 -arch ppc -arch ppc64" CPP="gcc -E" CXXCPP="g++ -E" --prefix=/usr
	make || return 1
}

package() {
	install -Dm664 ${srcdir}/Ubucompilator-${pkgver}/Ubucompilator/Ubucompilator.gambas ${pkgdir}/usr/bin/Ubucompilator.gambas
	mkdir -p ${pkgdir}/usr/share/${pkgname}/
	install -Dm644 ${srcdir}/Ubucompilator-${pkgver}/{AUTHORS,COPYING,ChangeLog,INSTALL,NEWS,README} ${pkgdir}/usr/share/${pkgname}/
}
