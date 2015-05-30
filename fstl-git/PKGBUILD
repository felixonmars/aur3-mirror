# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>

_pkgname=fstl
pkgname=${_pkgname}-git
pkgver=v0.9.2.r0.g5a38a2d
pkgrel=1
pkgdesc="A fast viewer for .stl files"
arch=(any)
url="http://www.mattkeeter.com/projects/fstl/"
license=('custom')
makedepends=('git' 'qt5-base')

source=("git+https://github.com/mkeeter/${_pkgname}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	mkdir -p build
    cd build
    qmake ../qt/${_pkgname}.pro
	make
}

package() {
	install -D ${srcdir}/${_pkgname}/build/${_pkgname} $pkgdir/usr/bin/${_pkgname}
}
