# Contributor: Alexander Yunin <firefalx@gmail.com>
pkgname=licq-osd
pkgver=1.3.2.2
pkgrel=1
pkgdesc="licq-osd is a licq plugin which provides an On Screen Display on new messages"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/licq-osd"
license=('GPL')
depends=(licq 'xosd>=2')
source=(http://forum.cswanderer.ru/osd-$pkgver.tar.gz)
md5sums=('c64820817d3eacdf1b57f9499880cf72')

build() {
  cd "$startdir/src/osd-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
