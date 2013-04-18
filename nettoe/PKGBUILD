# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
pkgname="nettoe"
pkgver=1.3.2
pkgrel=2
pkgdesc="A curses-based tic-tac-toe game"
arch=('i686' 'x86_64')
url="http://nettoe.sourceforge.net/"
license=('GPL')
depends=('ncurses')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1aba74312e968bb84c556c12c0713128148542b8b2879c78893c47d945da0e24')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
