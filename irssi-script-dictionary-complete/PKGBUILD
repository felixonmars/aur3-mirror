# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-dictionary-complete
_name=dictcomplete.pl
pkgver=1.31
pkgrel=2
pkgdesc="Caching dictionary based tab completion"
arch=(any)
url="http://scripts.irssi.org/"
source="http://scripts.irssi.org/scripts/$_name"
license=('GPL')
depends=('irssi' 'words')
md5sums=('8ddffc4dd95dde7666e9fc7caabe00f3')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
