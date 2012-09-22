# Contributor: Jan Hambrecht <jaham at gmx dot net>

pkgname=libspnav
pkgver=0.2.2
pkgrel=4
pkgdesc="The spacenav project provides a free, compatible alternative, to the proprietary 3Dconnexion device driver and SDK, for their 3D input devices (called 'space navigator', 'space pilot', 'space traveller', etc)."
arch=('i686' 'x86_64')
url="http://spacenav.sourceforge.net/"
license=('GPL')
makedepends=()
depends=('libx11')
provides=('libspnav')
options=()
install=
source=(http://downloads.sourceforge.net/spacenav/$pkgname-$pkgver.tar.gz Makefile.in.diff)
md5sums=('b85a0f4ab711e2d4f73a40e2e371f5ae'
         'f9122ad4ca823e45bfa0538187df6270')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p0 < $startdir/Makefile.in.diff
  ./configure --prefix=$pkgdir/usr --disable-debug
  make || return 1
  install -d $pkgdir/usr/lib
  install -d $pkgdir/usr/include
  make DESTDIR=$pkgdir install || return 1
}
