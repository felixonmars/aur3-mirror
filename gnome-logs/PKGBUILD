# Maintainer: Gary van der Merwe <garyvdm@gmail.com>
pkgname=gnome-logs
pkgver=3.11.90
pkgrel=1
pkgdesc="A log viewer for the systemd journal"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Logs"
license=('GPL3')
depends=('gtk3' 'systemd')
source=(https://download.gnome.org/sources/gnome-logs/3.11/$pkgname-$pkgver.tar.xz)
sha256sums=(4ee55da04acf256ba47736638de39afdae76146c2a093a21cdf4afa00911bdc2) 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$pkgname.schemas" \
    "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}
