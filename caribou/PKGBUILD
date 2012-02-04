# Maintainer: Adam Hani Schakaki <krzd@krzd.net>
pkgname=caribou
pkgver=0.3.5
pkgrel=1
pkgdesc="A text entry and UI navigation application being developed as an alternative to the Gnome On-screen Keyboard."
arch=('i686' 'x86_64')
url="http://live.gnome.org/Caribou"
license=('LGPL')
depends=('pyatspi' 'dbus-python')
makedepends=('gnome-doc-utils' 'intltool')
install=caribou.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.3/$pkgname-$pkgver.tar.xz)
sha256sums=('729aa2e896a434490b9728911a1087013c829f7d41259684518e101abd90a9d4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i s'|#!/usr/bin/python|#!/usr/bin/python2|'g tools/{fix_gir,make_schema}.py
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install

  sed -i s'|#!/usr/bin/python|#!/usr/bin/python2|'g ${pkgdir}/usr/bin/caribou

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain caribou ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}

# vim:set ts=2 sw=2 et:
