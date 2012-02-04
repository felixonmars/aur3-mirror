# Maintainer: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=tapioca
pkgver=0.3.9
pkgrel=1
pkgdesc="A daemon providing the VoIP engine and a client interface"
arch=('i686' 'x86_64')
url="http://tapioca-voip.sourceforge.net"
license="LGPL"
options=('NOLIBTOOL')
depends=('dbus-glib')
makedepends=('pkgconfig')
source=(http://dl.sourceforge.net/sourceforge/tapioca-voip/$pkgname-$pkgver.tar.gz)
md5sums=('e88c400394c092c2688bb2d490c80ccb')

build() {
  cd $startdir/src/tapioca-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
