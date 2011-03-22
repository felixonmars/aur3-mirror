# Maintainer: bbandi86 <bbandi86 at gmail dot com>

pkgname=firefox-branded-bin-hu
pkgver=4.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=('i686' 'x86_64')
url="http://www.mozilla.com/en-US/firefox/"
license=('MPL' 'GPL2' 'LGPL2')
depends=('sqlite3' 'nss' 'libxt' 'gtk2' 'desktop-file-utils' 'alsa-lib' 'dbus-glib')
provides=('firefox')
conflicts=('firefox')
install=${pkgname}.install
source=(ftp://ftp.mozilla.org/pub/firefox/releases/${pkgver}/linux-${CARCH}/hu/firefox-${pkgver}.tar.bz2
        firefox.desktop firefox-safe.desktop)
md5sums=('19bf375fd28e9b00a125c243a4e5fbbf'
         '0023a61a1f99da36c299bc13da80caf7'
         '67667183a2479b2aab345a80cdcaf513')

[[ "$CARCH" == "x86_64" ]] && md5sums[0]="f6fae7102d8907766ef3b1238d07028a"

pkgname_split=firefox-branded-bin

build() {
  install -d $pkgdir/usr/lib/$pkgname_split $pkgdir/usr/bin/
  cp -a $srcdir/firefox/* $pkgdir/usr/lib/$pkgname_split/
  ln -s /usr/lib/$pkgname_split/firefox $pkgdir/usr/bin/firefox

  install -d $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
  install -m644 $srcdir/firefox.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox-safe.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/firefox.png
}

