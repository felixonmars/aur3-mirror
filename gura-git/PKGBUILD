# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=gura-git
pkgver=r2710.2944b3e
pkgrel=1
pkgdesc="An iterator-oriented programming language"
arch=('i686' 'x86_64')
url="http://www.gura-lang.org/"
license=('GPL3')
depends=('gcc-libs' 'readline')
makedepends=('cmake' 'git')
provides=('gura')
source=("$pkgname"::'git://github.com/ypsitau/gura.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	./configure
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}