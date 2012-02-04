# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=libut
pkgver=2.0
pkgrel=2
pkgdesc="A server development library"
arch=('i686')
url="http://libut.sourceforge.net"
license=('custom')
source=(http://downloads.sourceforge.net/sourceforge/libut/libut-2.0.tar.bz2)
md5sums=('d084b5b2cb5ac3eb6c8bab47f064bf2d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  install -D LICENSE $startdir/pkg/usr/share/licenses/libut/COPYING
}
