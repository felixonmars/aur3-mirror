# Maintainer: Pascal Ernster <aur (AT) hardfalcon (DOT) net>

_pkgname=phonesim
pkgname="${_pkgname}-git"
pkgver=287.0054cc9
pkgrel=1
pkgdesc='phonesim is a soft modem that eliminates the need to have an actual AT modem connected to the system for testing and developing Ofono.'
arch=('x86_64' 'i686')
url="https://git.kernel.org/cgit/network/ofono/phonesim.git/"
license=('GPL2')
depends=('qt4')
makedepends=('automake')
optdepends=('ofono: needed to access the modem')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://git.kernel.org/pub/scm/network/ofono/${_pkgname}.git")

sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${_pkgname}"
	./bootstrap-configure --prefix=/usr
	#./configure --prefix=/usr
	make
}

check() {
	cd "${_pkgname}"
	make distcheck
}

package() {
	cd "${_pkgname}"
	make install DESTDIR="${pkgdir}"
}
