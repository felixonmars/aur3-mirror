#!/bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11@gmail.com>

pkgname=baamanga
pkgver=0.5
pkgrel=2
pkgdesc='Command-line tool to download manga from lots of websites'
arch=('i686' 'x86_64')
url="https://github.com/jorge-barroso/baamanga/"
license=('GPL2')
depends=('curlcpp-git')
provides=(baamanga)
conflicts=(baamanga-git)
install=baamanga.install
source=(https://github.com/jorge-barroso/${pkgname}/archive/${pkgver}.zip)
sha512sums=('86a9b9e1468111001c0bed9c21255d343bb94ec628cf588b2e3e5abe624009a221fa39cde368a2a8551fa41636d3bf7b390677144aca60d623533c358e358285')

build(){
cd ${srcdir}/${pkgname}-${pkgver}
	autoreconf --install
	./configure
	make
}

package() {
cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:

