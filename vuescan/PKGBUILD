# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Rafael Ferreira <josephgbr at archlinux dot info>
# Maintainer: David Spicer <azleifel at gmail dot com>

_pkgsourcename=VueScan
pkgname=vuescan
pkgver=9.5
pkgrel=1
pkgdesc="A powerful but easy to use OSI scanning tool (9.5 series)"
arch=('i686' 'x86_64')
url="http://www.hamrick.com/"
license=('custom')
depends=('gtk2' 'libsm' 'libusb-compat')
options=(!strip)
source=(license.txt vuescan.sh vuescan.desktop)
md5sums=('c5b9a854dfae7370cf0bead9840e5932'
         '206762349f8a221e92991d4cc5d2279a'
         '00b343c1d76e394347a75ebfe669b66c')
[ "${CARCH}" == "i686" ] && source+=(http://www.hamrick.com/files/vuex3295.tgz)
[ "${CARCH}" == "x86_64" ] && source+=(http://www.hamrick.com/files/vuex6495.tgz)
md5sums+=('SKIP')

package() {
  cd "$srcdir"

  # Application
  install -d -m755 "$pkgdir/opt/$pkgname"
  cp -rp "$_pkgsourcename"/* "$pkgdir/opt/$pkgname/"

  # Extras
  install -D -m755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # License
  install -D -m644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

