# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=firefox-branded-bin-es-es
pkgver=4.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org (Castilian Spanish)"
arch=('i686' 'x86_64')
url="http://www.mozilla-europe.org/es/firefox/"
license=('MPL' 'GPL2' 'LGPL2')
depends=('sqlite3' 'nss' 'libxt' 'gtk2' 'desktop-file-utils' 'alsa-lib' 'dbus-glib')
provides=('firefox')
conflicts=('firefox')
install=${pkgname}.install
source=(ftp://ftp.mozilla.org/pub/firefox/releases/${pkgver}/linux-${CARCH}/es-ES/firefox-${pkgver}.tar.bz2
        firefox.desktop firefox-safe.desktop)
md5sums=('ab9fdfa2ad12712cd8d9c9c786472312'
         'e4e16110142ccbc5caf53bbbf409fd62'
         'c17610ead7e29657fed005b6a33a9293')

[[ "$CARCH" == "x86_64" ]] && md5sums[0]="a0664d694059a5c2afde70bd0404e19c"

build() {
  install -d $pkgdir/usr/lib/$pkgname $pkgdir/usr/bin/
  cp -a $srcdir/firefox/* $pkgdir/usr/lib/$pkgname/
  ln -s /usr/lib/$pkgname/firefox $pkgdir/usr/bin/firefox

  install -d $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
  install -m644 $srcdir/firefox.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox-safe.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/firefox.png
}

