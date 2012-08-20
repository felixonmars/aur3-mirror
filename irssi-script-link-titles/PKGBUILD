# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-link-titles
_name=link_titles.pl
pkgver=0.1
pkgrel=2
pkgdesc="Catch urls in channel and print the page title."
arch=(any)
url="https://github.com/pbrisbin/irssi-scripts"
source="https://raw.github.com/pbrisbin/irssi-scripts/master/$_name"
license=('GPL')
depends=('irssi')
md5sums=('d590f49ad3d419571145844ebe2b9fb0')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
