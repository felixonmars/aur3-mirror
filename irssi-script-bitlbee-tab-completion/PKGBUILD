# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-bitlbee-tab-completion
_name=bitlbee_tab_completion.pl
pkgver=0.5
pkgrel=2
pkgdesc="Intelligent Tab-completion for BitlBee commands"
arch=(any)
url="http://scripts.irssi.org/"
source="http://scripts.irssi.org/scripts/$_name"
license=('GPL')
depends=('irssi')
md5sums=('230124796fc743e7cbf9958394048163')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
