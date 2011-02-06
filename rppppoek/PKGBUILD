# Maintainer: Heiko Baums <heiko@baums-on-web.de>

pkgname=rppppoek
pkgver=0.40
pkgrel=5
pkgdesc="KDE panel applet for managing RP-PPPoE (tm)"
arch=(i686 x86_64)
url="http://segfaultskde.berlios.de/index.php?content=rppppoek"
license=('GPL')
depends=('kdelibs3' 'rp-pppoe' 'sudo' 'net-tools')
source=(http://download.berlios.de/segfaultskde/$pkgname-$pkgver.tar.bz2)
md5sums=('255714cf0f701c715a689493774ea85f')

build() {
  cd $srcdir/$pkgname-$pkgver/src
  sed -i "s/\/usr\/bin\/echo/\/bin\/echo/g" rppppoek.sh
  sed -i "s/\/usr\/bin\/cut/\/bin\/cut/g" rppppoek.sh
  cd ..
  ./configure --without-arts --prefix=/opt/kde
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/src
  make DESTDIR=$pkgdir install
}
