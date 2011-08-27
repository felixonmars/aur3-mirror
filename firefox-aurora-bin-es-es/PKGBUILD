# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=firefox-aurora-bin-es-es
pkgver=8.0a2
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org (Aurora channel, Castilian Spanish)"
url="http://www.mozilla.com/es-ES/firefox/channel/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL2' 'LGPL2')
depends=('sqlite3' 'nss' 'libxt' 'gtk2' 'desktop-file-utils' 'alsa-lib' 'dbus-glib')
install=${pkgname}.install
source=(ftp://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-aurora-l10n/firefox-${pkgver}.es-ES.linux-${CARCH}.tar.bz2
        firefox-aurora.desktop firefox-aurora-safe.desktop)
md5sums=('b3e9830f730cd4edafd0edcd1730127a'
         'd0a6c2ce6a1f2b19d36170789149f5d8'
         '48de8e2f51a9267436cf3acda9052fac')

[[ "$CARCH" == "x86_64" ]] && md5sums[0]="345d760d582e567d7a89310e92b45f8a"

build() {
  install -d $pkgdir/usr/lib/$pkgname $pkgdir/usr/bin/
  cp -a $srcdir/firefox/* $pkgdir/usr/lib/$pkgname/
  # Comment out the following line if you want the Feedback extension
  rm -rf $pkgdir/usr/lib/$pkgname/distribution
  ln -s /usr/lib/$pkgname/firefox $pkgdir/usr/bin/firefox-aurora

  install -d $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
  install -m644 $srcdir/firefox-aurora.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox-aurora-safe.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox/icons/mozicon128.png $pkgdir/usr/share/pixmaps/firefox-aurora.png
}
