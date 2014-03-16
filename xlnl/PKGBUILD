# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=xlnl
pkgver=3.4.20
_sfver=60770
_sgver=60773
pkgrel=1
pkgdesc='Labyrinths & Legends - A Rogue-like Fantasy RPG (graphical version)'
arch=('i686' 'x86_64')
url="http://lnl.sourceforge.jp/en/"
license=('GPL')
depends=('gtk2' 'gpm' 'ncurses' 'sdl_mixer')
install=xlnl.install
source=("http://jaist.dl.sourceforge.jp/lnl/${_sfver}/xlnl-${pkgver}.tar.gz" "http://jaist.dl.sourceforge.jp/lnl/${_sgver}/xlnl-graph-${pkgver}-light.tar.gz" "xlnl.desktop")

build() {
	cd "${srcdir}/xlnl-${pkgver}"
	./configure --prefix=/usr
	cd "${srcdir}/xlnl-${pkgver}/src"
	sed -i 's/\-lSDL\ \-lSDL\_mixer/\-lSDL\ \-lX11\ \-lSDL\_mixer/g' Makefile
	cd "${srcdir}/xlnl-${pkgver}"
	make
}

package() {
	cd "${srcdir}/xlnl-${pkgver}"
	make DESTDIR="$pkgdir" install
	cd "${srcdir}"
	install -dm644 "$pkgdir/usr/share/${pkgname}"
	cp -r .lnl "$pkgdir/usr/share/${pkgname}"
	install -Dm644 xlnl.desktop "${pkgdir}/usr/share/applications/xlnl.desktop"
}

md5sums=('61cdb543fc6c2513626685efeeb71ff2'
         'd4736a876168a614eaa866af1f90a681'
         'bc8c61d2c809c0ad2d52fab4355b3c09')
