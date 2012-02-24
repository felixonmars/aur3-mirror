# Maintainer: Stefano Facchini <stefano.facchini@gmail.com>

pkgname=coverama
pkgver=0.1
pkgrel=2
pkgdesc="Coverama is a screensaver showing rotating cover art pictures."
depends=('gnome-screensaver' 'gtkglext' 'gnome-menus2' 'gtk2')
provides=('coverama')
arch=('i686' 'x86_64')
license=('GPL2')
url="http://coverama.sourceforge.net"
source=(https://downloads.sourceforge.net/project/coverama/coverama.tar.bz2)
sha256sums=('84d6930233e278611a3850c8db22b59fb47c5ae1ffd7a7442477ae1bd232bb01')


build() {

  cd $srcdir/coverama

  ./build.sh

}


package() {

  cd $srcdir/coverama

  DESTDIR=$pkgdir ./install.sh

}

