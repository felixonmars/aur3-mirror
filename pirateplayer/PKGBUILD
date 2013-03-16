# created 14:21:01 - 12/10/10
# Maintainer: jackuess <chucky at wrutschkow.org> 

pkgname=pirateplayer
pkgver=0.5.0
pkgrel=1
pkgdesc="Qt-based utility for downloading swedish online television"
url="http://pirateplay.se/pirateplayer"
license="GPL"
arch=('i686' 'x86_64')
depends=('qt4' 'rtmpdump' 'ffmpeg' 'tidy-html5-git' 'libarchive' 'qtdesktopcomponents-qt4')
conflicts=('pirateplayer')
provides=('pirateplayer')
source=(http://github.com/jackuess/pirateplayer/archive/v$pkgver.tar.gz)
md5sums=('f1cb3208aa4ebcefc8c06b6173206bf0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt4 PREFIX=/usr || return 1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make INSTALL_ROOT=${pkgdir} install || return 1
}
