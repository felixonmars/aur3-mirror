# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=firefox-bin-es-es
pkgver=7.0.1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org (Castilian Spanish)"
url="http://www.mozilla.org/es-ES/firefox/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL2' 'LGPL2')
depends=('sqlite3' 'nss' 'libxt' 'gtk2' 'desktop-file-utils' 'alsa-lib' 'dbus-glib')
provides=('firefox')
conflicts=('firefox' 'firefox-i18n-es-es')
install=${pkgname}.install
source=(ftp://ftp.mozilla.org/pub/firefox/releases/${pkgver}/linux-${CARCH}/es-ES/firefox-${pkgver}.tar.bz2
        firefox.desktop firefox-safe.desktop)
md5sums=('5c3f6d3632240204ee75879aba89442d'
         'e4e16110142ccbc5caf53bbbf409fd62'
         'c17610ead7e29657fed005b6a33a9293')

[[ "$CARCH" == "x86_64" ]] && md5sums[0]="e4598ae4292d758443220a7ac635b9b2"

build() {
  install -d $pkgdir/usr/lib/$pkgname $pkgdir/usr/bin/
  cp -a $srcdir/firefox/* $pkgdir/usr/lib/$pkgname/
  ln -s /usr/lib/$pkgname/firefox $pkgdir/usr/bin/firefox

  install -d $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
  install -m644 $srcdir/firefox.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox-safe.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/firefox.png
}
