# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-xft-hg
epoch=1
pkgver=244
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X, xft branch'
url='http://hg.suckless.org/st'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'libxft')
makedepends=('mercurial' 'ncurses')

provides=('st')
conflicts=('st')

_hgroot='http://hg.suckless.org/'
_hgrepo='st'

build() {
	cd "${srcdir}"

	cd "${_hgrepo}" && hg pull -u && hg update xft && cd .. ||

	rm -fr build; cp -a "${_hgrepo}" build; cd build
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${srcdir}/build"
	make PREFIX=/usr DESTDIR="${pkgdir}" TERMINFO="${pkgdir}/usr/share/terminfo" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
