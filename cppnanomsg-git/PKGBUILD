
# Maintainer: jellysheep <max.mail@dameweb.de>

_pkgname=cppnanomsg
pkgname=cppnanomsg-git
pkgver=396a450
pkgrel=1
pkgdesc='Simple high-performance implementation of several "scalability protocols" (C++ binding)'
url='http://nanomsg.org/'
license=('MIT')
source=('git://github.com/nanomsg/cppnanomsg.git')
md5sums=('SKIP')
arch=('any')
depends=('nanomsg')
makedepends=('git')
checkdepends=('cmake')
provides=('cppnanomsg')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --always | sed 's|-|.|g'
}

check() {
	cd "${srcdir}/${_pkgname}"
	mkdir build
	cd build
	cmake ../
	make
	make test
}

package() {
	install -Dm644 "${srcdir}/${_pkgname}/nn.hpp" "${pkgdir}/usr/include/nanomsg/nn.hpp"
	install -Dm644 "${srcdir}/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}
