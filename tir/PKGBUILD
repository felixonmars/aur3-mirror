# Maintainer: John "ShaggyTwoDope" Jenkins <twodopeshaggy at gmail dot com>
pkgname=tir
pkgver=0.2.2
pkgrel=1
pkgdesc="Terminal Image Renderer"
arch=('i686' 'x86_64')
url=https://github.com/shaggytwodope/tir
license=(GPL3)
makedepends=('go')
provides=('tir')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shaggytwodope/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('3733e35e047e9b812129133077814e5def1fc431')

build() {
	export GOPATH="${srcdir}/godir"
	mkdir -p "$GOPATH"
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D tir "${pkgdir}/usr/bin/tir"
}

