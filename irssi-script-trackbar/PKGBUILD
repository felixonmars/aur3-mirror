# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-trackbar
_name=trackbar.pl
pkgver=1.7
pkgrel=1
pkgdesc="Shows a bar where you've last read a window"
arch=(any)
url="http://scripts.irssi.org/"
source="http://scripts.irssi.org/scripts/$_name"
license=('GPL')
depends=('irssi')
md5sums=('fbc81ab5e7005bdd2a3e6349e99dda54')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
