# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgname=libappindicator
pkgname=libappindicator3
pkgver=12.10.0
pkgrel=2
pkgdesc="Library to allow applications to export a menu into the Unity Menu bar (GTK+ 3 library)"
arch=('i686' 'x86_64')
url="https://launchpad.net/libappindicator"
license=('LGPL')
depends=('libdbusmenu-gtk3' 'libindicator-gtk3')
makedepends=('dbus-glib' 'gobject-introspection' 'gtk-sharp-2' 'perl-xml-libxml' 'pygtk' 'vala')
options=('!libtool')
source=(http://launchpad.net/libappindicator/${pkgver%.*}/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('41910f2005edee9240da1e53fffcdc12')

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static --with-gtk=3
  make -j1
}

package(){
  cd "$_pkgname-$pkgver"
  make -C src DESTDIR="$pkgdir/" install
  make -C bindings/vala DESTDIR="$pkgdir/" install
}

