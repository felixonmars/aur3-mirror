# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=vala-dbus-binding-tool
pkgver=0.4.0
pkgrel=1
pkgdesc="Creates gobject interfaces out of DBus XML specifications."
arch=('i686' 'x86_64')
url="http://wiki.freesmartphone.org/index.php/Implementations/vala-dbus-binding-tool"
license=('GPLv3')
depends=('vala' 'dbus')
source=("$pkgname"::'git://git.freesmartphone.org/vala-dbus-binding-tool.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  sed 's/AC_INIT(.*\[\([0123456789.]*\)\].*/\1/;T;q' configure.ac
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}
