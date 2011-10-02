# Packager: Sonny Piers <sonny@fastmail.net>

pkgname=node-formidable
pkgver=1.0.6
pkgrel=1
pkgdesc="A node.js module for parsing form data, especially file uploads."
arch=("i686" "x86_64")
url="https://github.com/felixge/node-formidable"
license="MIT"
depends=("nodejs>=0.4.0")
source=("https://nodeload.github.com/felixge/node-formidable/tarball/v${pkgver}")
md5sums=("0a7b303ac42001c2e85736b190e8c677")

build() {
	cd $srcdir/felixge-node-formidable-ee807d5

	mkdir -p $pkgdir/usr/lib/node/$pkgname
	cp -r * $pkgdir/usr/lib/node/$pkgname
}
