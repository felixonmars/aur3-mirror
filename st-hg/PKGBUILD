# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-hg
epoch=1
pkgver=321
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X'
url='http://hg.suckless.org/st'
license=('MIT')
depends=('libxext')
makedepends=('mercurial' 'ncurses')
arch=('i686' 'x86_64' 'armv7h')

provides=('st')
conflicts=('st')

_hgroot='http://hg.suckless.org/'
_hgrepo='st'

build() {
	cd "${srcdir}"

	cd "${_hgrepo}" && hg pull -u && cd .. || hg clone "${_hgroot}${_hgrepo}"
	rm -fr build; cp -a "${_hgrepo}" build; cd build

	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${srcdir}/build"
	make PREFIX=/usr DESTDIR="${pkgdir}" TERMINFO="${pkgdir}/usr/share/terminfo" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
