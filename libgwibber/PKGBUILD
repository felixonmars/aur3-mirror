# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=libgwibber
pkgver=0.1.1
pkgrel=1
pkgdesc="The Gwibber API"
arch=('i686' 'x86_64')
url="https://launchpad.net/gwibber/libgwibber"
license=('LGPL')
depends=('gtk2>=2.18' 'libgee' 'dee>=0.5' 'json-glib' 'dbus-glib')
makedepends=('vala>=0.7.8' 'intltool>=0.35.0' 'gnome-doc-utils>=0.3.2''gobject-introspection>=0.6.7' 'gtk-sharp-2>=2.12.1')
options=(!libtool)
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.orig.tar.gz)
md5sums=('bc059801ae10940aa4c3ce3b49f65b2c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
