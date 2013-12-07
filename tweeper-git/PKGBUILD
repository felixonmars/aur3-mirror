# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=tweeper-git
pkgver=0.2.4.g50ffc18
pkgrel=1
pkgdesc="A Twitter to RSS web scraper"
arch=('any')
url="http://git.ao2.it/tweeper.git/"
license=('GPL')
depends=('php')
makedepends=('git')
provides=('tweeper')
source=("$pkgname"::'git://git.ao2.it/tweeper.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

build() {
	cd "$pkgname"
	sed -i 's/\/usr\/local/\/usr/g' Makefile
	make PREFIX=/usr
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}