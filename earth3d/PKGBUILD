# Maintainer: TDY <tdy@gmx.com>

pkgname=earth3d
pkgver=1.0.5
pkgrel=1
pkgdesc="A map client for displaying a 3D model of the world"
arch=('i686' 'x86_64')
url="http://www.earth3d.org/"
license=('GPL')
depends=('qt3')
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}_client-$pkgver-src.tar.bz2
        $pkgname-$pkgver-gcc44.diff)
md5sums=('d273437a473f66401b01acf7521808c3'
         'e796d6f1feb36a67fdfee1e940b2c057')

build() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i ../$pkgname-$pkgver-gcc44.diff || return 1
  . /etc/profile.d/qt3.sh
  /opt/qt/bin/qmake || return 1
}

package() {
  cd "$srcdir/$pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
