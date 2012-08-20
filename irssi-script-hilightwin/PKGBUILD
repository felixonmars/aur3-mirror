# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-hilightwin
_name=hilightwin.pl
pkgver=0.02
pkgrel=2
pkgdesc="Print hilighted messages to window named hilight"
arch=(any)
url="http://scripts.irssi.org/"
source="http://scripts.irssi.org/scripts/$_name"
license=('GPL')
depends=('irssi')
md5sums=('059697568ffb2f6e8ce66370e2d74000')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
