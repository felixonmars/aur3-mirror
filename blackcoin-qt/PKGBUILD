# Based off blackcoin-qt-git by aaron-lebo
# Based off dogecoin-git-qt by gee
# Based off primecoin-qt by Daniel Spies

_name=blackcoin
pkgname=blackcoin-qt
pkgver=1.1.2.1
pkgrel=2
pkgdesc='PoS Cryptocurrency'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='http://blackcoin.co/'
license=('MIT')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'git')
source=("https://github.com/rat4/${_name}/archive/v${pkgver}.tar.gz" "${_name}.desktop")
install="${pkgname}.install"
sha256sums=('8d77247354c3a32a558f5bb4adb2c3fd3a2624095b2190fd3949f8ecd1f44694'
            '3ec84ddaa631f907edceec30a23cfed075a342aa5af0a217fca5617619063b16')

build() {
        cd ${_name}-${pkgver}
        qmake-qt4 ${_name}-qt.pro
        make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
        install -Dm644 ${_name}.desktop ${pkgdir}/usr/share/applications/${_name}.desktop
        cd ${_name}-${pkgver}
        install -Dm755 ${_name}-qt "${pkgdir}"/usr/bin/${_name}-qt
        install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
        install -Dm644 src/qt/res/icons/novacoin.png ${pkgdir}/usr/share/pixmaps/${_name}.png
}
