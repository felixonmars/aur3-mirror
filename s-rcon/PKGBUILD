# Maintainer: mickael9 <mickael9 at gmail dot com>

pkgname=s-rcon
pkgver=1.10
pkgrel=1
pkgdesc='seans small and simple remote console for half-life'
arch=('i686' 'x86_64')
url='http://cs.swarthmore.edu/~finney/s-rcon/index.html'
license=('GPL')
depends=('glibc')
makedepends=('gcc')
source=("http://cs.swarthmore.edu/~finney/${pkgname}/${pkgname}-src.tgz")
md5sums=('dfeda7abbcffc9c49e0f228bf17b0e67')

build() {
	cd ${srcdir}/s-rcon/
	./configure
	make
	mkdir -p ${pkgdir}/usr/bin
	cp s-rcon ${pkgdir}/usr/bin/
}
