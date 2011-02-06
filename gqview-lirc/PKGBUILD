# Maintainer: zimt email: $MYNICKNAME at enveng dot de
pkgname=gqview-lirc
pkgver=2.0.4
pkgrel=1
pkgdesc="gqview with lirc support"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk2' 'lirc')
source=("http://heanet.dl.sourceforge.net/gqview/gqview-$pkgver.tar.gz" \
	"http://www.tautologica.org/beniamino/download/patch-gqview-$pkgver-lirc.gz")
md5sums=('7196deab04db94cec2167637cddc02f9'
         '10ed6de1078802fd50df5796f3fd8b99')
url="http://www.tautologica.org/beniamino/gqview-lirc.html"

build() {
  cd $startdir/src
  patch -p0 < patch-gqview-$pkgver-lirc
  cd $startdir/src/gqview-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
