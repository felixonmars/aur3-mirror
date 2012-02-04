# Contributor: Tomas Kopecny <georgo10 at gmail.com>

pkgname=kooltime
pkgver=0.3
pkgrel=2
pkgdesc="KoolTime is a KDE Kicker Applet. It displays time in a new funky way."
url="http://kooltime.yonen.ca"
depends=('kdelibs') 
source=(http://kooltime.yonen.ca/$pkgname-$pkgver.tar.gz)
md5sums=('b40955e588ecb4c40ec141847b4be8ac')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde -C
  make || return 1
  make DESTDIR=$startdir/pkg/ install
}
