# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-away
_name=away.pl
pkgver=0.23
pkgrel=2
pkgdesc="Away with reason, unaway, and autoaway"
arch=(any)
url="http://scripts.irssi.org/"
source="http://scripts.irssi.org/scripts/$_name"
license=('GPL')
depends=('irssi')
md5sums=('ecb88c0addf16640b46f76d974ab55dc')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
