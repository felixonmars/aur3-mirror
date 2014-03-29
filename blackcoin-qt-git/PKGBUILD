# Maintainer aaron-lebo 
# Based off dogecoin-git-qt by gee 
# Based off primecoin-qt by Daniel Spies

pkgname=blackcoin-qt-git
pkgver=v1.0.5.r1.ga9c889c
_gitname=blackcoin
_binname=blackcoin
pkgrel=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://blackcoin.co/"
license=('MIT')
provides=('blackcoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('git+https://github.com/rat4/blackcoin.git' 'blackcoin.desktop')
install=$pkgname.install
sha256sums=('SKIP'
            '3ec84ddaa631f907edceec30a23cfed075a342aa5af0a217fca5617619063b16')

pkgver() {
	cd "$srcdir/${_gitname}"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${_gitname}
	qmake-qt4 ${_binname}-qt.pro
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop
	cd ${_gitname}
	install -Dm755 ${_binname}-qt "$pkgdir"/usr/bin/${_binname}-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/novacoin.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}
