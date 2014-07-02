# Maintainer: Ben Bromley <ben at amongotheritems dot org>
pkgname=libpff
pkgver=20131028
pkgrel=1
pkgdesc="Library and tools to access the Personal Folder File (PFF) and the Offline Folder File (OFF) format, commonly used by .pst and .ost files."
arch=('any')
url="https://code.google.com/p/libpff/"
license=('GPL3')
optdepends=('zlib: compressed .ost files')
source=(https://da1ba3cfdffc2404250f16d3711dfb32dcd40e96.googledrive.com/host/0B3fBvzttpiiScU9qcG5ScEZKZE0/libpff-experimental-20131028.tar.gz)
md5sums=(b156f87e4241b7c680af43554153cf62) #generate with 'makepkg -g'

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
