# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
pkgname=mellowplayer
pkgver=1.4.0
pkgrel=1
pkgdesc="Open source and cross-platform desktop application that runs web-based music streaming
         services in its own window and provides integration with your desktop."
url='https://github.com/ColinDuquesnoy/MellowPlayer'
license=('GPL')
arch=('any')
depends=('qt5-base' 'qt5-webkit' 'flashplugin' 'libnotify')
optdepends=('flashplugin')
conflicts=('mellowplayer-kde')
makedepends=('qt5-tools')
source=("https://github.com/ColinDuquesnoy/MellowPlayer/archive/${pkgver}.tar.gz")
md5sums=('690e4e3f07ef6611be28f0cbe02defb7')

build() {
  cd $srcdir/MellowPlayer-${pkgver}

  qmake-qt5
  make
}

package() {
  cd $srcdir/MellowPlayer-${pkgver}

  make INSTALL_ROOT=${pkgdir} install
}
