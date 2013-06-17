# Maintainer: Luka Dornhecker <luka.dornhecker@gmail.com>
pkgname=chanloader
pkgver=0.0.1
pkgrel=1
pkgdesc="4chan command-line image downloader"
arch=("i686" "x86_64" "arm")
url="https://github.com/lukad/chanloader"
license=('GPL')
makedepends=("go")
provides=("chanloader")
source=(https://github.com/lukad/$pkgname/archive/v$pkgver.tar.gz)
md5sums=(14d8a8c48e19c2d9740ce8afe2682865)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build
	install -D -m755 ${pkgname}-${pkgver} ${pkgdir}/usr/bin/${pkgname} || return 1
}