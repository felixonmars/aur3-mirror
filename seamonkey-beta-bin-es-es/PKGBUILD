# Contributor: megadriver <megadriver at gmx dot com>

pkgname=seamonkey-beta-bin-es-es
pkgver=2.3b3
pkgrel=1
pkgdesc="SeaMonkey internet suite (beta version, Castilian Spanish)"
url="http://www.seamonkey-project.org"
license=('MPL' 'GPL2' 'LGPL2')
arch=('i686')
depends=('nss' 'libxt' 'gtk2' 'alsa-lib' 'dbus-glib')
source=("ftp://ftp.mozilla.org/pub/mozilla.org/seamonkey/releases/${pkgver}/linux-i686/es-ES/seamonkey-${pkgver}.tar.bz2"
         seamonkey-beta.desktop)
md5sums=('ba7347db6fe5ab646377712d362db51b'
         '167e6f77f866689209402f71313a6908')

build() {
  install -d $pkgdir/usr/lib/$pkgname $pkgdir/usr/bin/
  cp -a $srcdir/seamonkey/* $pkgdir/usr/lib/$pkgname/
  # Comment out the following line if you want ChatZilla, the DOM Inspector and Venkman pre-installed
  rm -rf $pkgdir/usr/lib/$pkgname/distribution
  ln -s /usr/lib/$pkgname/seamonkey $pkgdir/usr/bin/seamonkey-beta

  install -d $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
  install -m644 $srcdir/seamonkey-beta.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/seamonkey/chrome/icons/default/seamonkey.png $pkgdir/usr/share/pixmaps/seamonkey-beta.png
}
