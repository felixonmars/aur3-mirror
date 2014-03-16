# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=lnl
pkgver=3.4.20
_sfver=60769
pkgrel=1
pkgdesc='Labyrinths & Legends - A Rogue-like Fantasy RPG'
arch=('i686' 'x86_64')
url="http://lnl.sourceforge.jp/en/"
license=('GPL')
depends=('ncurses')
source=("http://jaist.dl.sourceforge.jp/lnl/${_sfver}/lnl-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/lnl-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/lnl-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('6e92ca939e5bc79fd07289938f9a2699')
