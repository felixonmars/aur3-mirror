# Maintainer: Thomas NJ Shadwell <thomas.shadwell @t google maildot com>
pkgname=closure-library
pkgver=0.0.0
pkgrel=1
pkgdesc="The Closure Library from Google."
arch=('any' 'i686' 'x86_64')
url="https://developers.google.com/closure/library/"
license=('GPL')
makedepends=('git')
source=('git+https://code.google.com/p/closure-library/')
md5sums=('SKIP')

build() {
	mkdir "$pkgdir/opt"
	cp "closure-library" "$pkgdir/opt" -r
}
