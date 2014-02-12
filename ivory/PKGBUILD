# Maintainer: Richard Wiedenhöft <richard.wiedenhoeft@gmail.com>
pkgname=ivory
pkgver=0.2.0
pkgrel=2
pkgdesc="A Webbrowser written in vala"
url="https://www.metanoise.net/ivory"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gtk3' 'webkitgtk2')
makedepends=('cmake' 'vala' 'git' 'gettext' 'intltool')
source=("https://www.metanoise.net/packages/${pkgname}-${pkgver}.tar.bz2")
md5sums=('82abe09e4191756b2e0e2ebd211fed7c')
install=ivory.install

build() {
	cd ${pkgname}-${pkgver}
	./configure \
		--prefix=/usr \
		--disable-desktop-update \
		--disable-icon-update \
		--disable-schema-compile
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
