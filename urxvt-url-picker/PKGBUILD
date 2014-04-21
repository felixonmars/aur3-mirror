# Maintainer: Doug Elkin <drelkin86@gmail.com>

pkgname="urxvt-url-picker"
pkgver="0.01"
pkgrel=1
pkgdesc="Open URLs in rxvt-unicode using the keyboard. Like urxvt-url-select, but implements a vimperator-style URL selection, primitively handles wrapped URLs, and can also be used in conjunction with matcher"
arch=("any")
makedepends=('mercurial')
depends=('rxvt-unicode')
license=("OWL")
url='https://bitbucket.org/sterlingcamden/urlpicker'
install='urxvt-url-picker.install'
source=()
md5sums=()

_extension="url-picker"

package() {
  cd "$srcdir"
  hg clone $url
  cd "urlpicker"

  install -D -m 644 "$_extension" "$pkgdir/usr/lib/urxvt/perl/$_extension"
  install -D -m 644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m 644 "README" "$pkgdir/usr/share/doc/$pkgname/README"
}

