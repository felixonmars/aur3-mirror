# Contributor: ganjolinux aka basalari david <ganjolinux@gmail.com>

pkgname=crow
pkgver=2.11.3
pkgrel=1
pkgdesc="A modern GUI builder for the GTK+ toolkit"
arch=('i686')
url="http://crow-designer.sourceforge.net/"
license=('MIT')
depends=('guiloader-c++' 'dbus-glib')
makedepends=('pkgconfig>=0.9')
options=('!libtool')
source=(http://downloads.sourceforge.net/crow-designer/$pkgname-$pkgver.tar.bz2)
md5sums=('36f54240ff3f35067a1587b3bd884e48')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr --enable-hiddenvisibility
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -m644 -D COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
