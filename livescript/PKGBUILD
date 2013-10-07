# Maintainer: Josh Klar <j@iv597.com>

pkgname=livescript
pkgver=1.2.0
pkgrel=1
pkgdesc='LiveScript is a language that compiles to JavaScript.'
arch=any
url=http://livescript.net
license=(custom)
depends=(nodejs)
optdepends=()

build() {
	cd $srcdir
	npm install LiveScript
}

package() {
	cd $pkgdir
	mkdir -p $pkgdir/usr/lib/node_modules
	cp -a $srcdir/node_modules/LiveScript $pkgdir/usr/lib/node_modules/
	mkdir -p $pkgdir/usr/bin
	ln -sf /usr/lib/node_modules/LiveScript/bin/{slake,lsc,livescript} $pkgdir/usr/bin/
}
