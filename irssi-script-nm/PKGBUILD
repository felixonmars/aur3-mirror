# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-nm
_name=nm.pl
pkgver=0.3.10
pkgrel=2
pkgdesc="Right aligned nicks depending on longest nick"
arch=(any)
url="http://scripts.irssi.org/"
source="http://scripts.irssi.org/scripts/$_name"
license=('GPL')
depends=('irssi')
md5sums=('3fed1f29d9062bfd1badd4628d8f4b92')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
