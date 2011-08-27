# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: helios

pkgname=seamonkey-beta-bin
pkgver=2.3b3
pkgrel=1
pkgdesc="SeaMonkey internet suite (beta version)"
arch=('i686' 'x86_64')
url="http://www.seamonkey-project.org"
license=('MPL' 'GPL2' 'LGPL2')
depends=('nss' 'libxt' 'gtk2' 'alsa-lib' 'dbus-glib')
source=(seamonkey-beta.desktop)
md5sums=('167e6f77f866689209402f71313a6908')

case ${CARCH} in
  i686)
    source=(${source[@]} "ftp://ftp.mozilla.org/pub/mozilla.org/seamonkey/releases/${pkgver}/linux-i686/en-US/seamonkey-${pkgver}.tar.bz2")
    md5sums=(${md5sums[@]} 'c12c3edefcbd03dd1af1c488c10e6169');;
  x86_64)
    source=(${source[@]} "ftp://ftp.mozilla.org/pub/mozilla.org/seamonkey/releases/${pkgver}/contrib/seamonkey-${pkgver}.en-US.linux-${CARCH}.tar.bz2")
    md5sums=(${md5sums[@]} '7a6e34dccd5f9c0fee7f767b2f63a968');;
esac

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
