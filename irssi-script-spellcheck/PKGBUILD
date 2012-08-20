# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=irssi-script-spellcheck
_name=spellcheck.pl
pkgver=0.3
pkgrel=2
epoch=
pkgdesc="Checks for spelling errors using Aspell."
arch=(any)
url="http://scripts.irssi.org/"
source="http://scripts.irssi.org/scripts/$_name"
license=('GPLv2')
depends=('irssi' 'perl-text-aspell')
md5sums=(181a8cba8a8affa297301749731e7a10)

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
