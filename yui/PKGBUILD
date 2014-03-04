# Maintainer: Ecmel Ercan <ecmel dot ercan at gmail dot com>
pkgname=yui
pkgver=3.15.0
pkgrel=1
pkgdesc="An open source JavaScript and CSS library"
url="http://yuilibrary.com/"
arch=('any')
license=('BSD')
options=(!strip !zipman)
source=(http://yui.zenfs.com/releases/yui3/${pkgname}_${pkgver}.zip)
md5sums=('5c0ad2385338fffcf00e8ec460b65935')

package() {
  mkdir -p "$pkgdir/usr/share/javascript"
  mv "$srcdir/yui" "$pkgdir/usr/share/javascript/"
}


