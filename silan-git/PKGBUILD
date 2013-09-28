# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=silan-git
pkgver=0.3.2.1.g3e83b80
pkgrel=1
pkgdesc="A standalone application to analyze audio files for silence"
arch=('i686' 'x86_64')
url="https://github.com/x42/silan/"
license=('GPL')
depends=('ffmpeg' 'libsndfile')
makedepends=('git')
provides=('silan')
source=("$pkgname"::'git://github.com/x42/silan.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

build() {
	cd "$pkgname"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}