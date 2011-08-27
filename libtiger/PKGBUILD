# Contributer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=libtiger
pkgver=0.3.4
pkgrel=1
pkgdesc="A rendering library for Kate streams using Pango and Cairo"
url="http://${pkgname}.googlecode.com/"
license="LGPL"
arch=("i686" "x86_64")
depends=("libkate" "pango")
makedepends=()
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=("dc1dbeb658c95485ba10b9b2897b4ae2")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr
	msg "Starting build process."
	make || return 1
	make DESTDIR=${pkgdir} install
}

