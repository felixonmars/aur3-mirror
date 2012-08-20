# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-bitlbee-typing-notice
_name=bitlbee_typing_notice.pl
pkgver=1.7.1
pkgrel=2
pkgdesc="Adds an item to the status bar when someone is typing"
arch=(any)
url="http://scripts.irssi.org/"
source="http://scripts.irssi.org/scripts/$_name"
license=('GPL')
depends=('irssi')
md5sums=('3f4c1fbfa0404ba1c9b086d08291e5e2')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
