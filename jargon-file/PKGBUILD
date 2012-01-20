# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=jargon-file
pkgver=4.4.7
pkgrel=1
pkgdesc="The Jargon File, in HTML form"
arch=("any")
url="http://catb.org/~esr/jargon/"
license=('GPL')
source=("http://catb.org/~esr/jargon/jargon-$pkgver.tar.gz")
sha1sums=('5019fecaf3eec8647e8193551a964176fa44b26c')

build() {
  cd "$srcdir/jargon-$pkgver"
  find "html" -name '*.html' -exec sed -i 's/<head>/&<meta charset="utf-8">/' {} +
}

package() {
  cd "$srcdir/jargon-$pkgver"
  install -d "$pkgdir/usr/share"
  cp -rv "html" "$pkgdir/usr/share/jargon"
}

# vim:set ts=2 sw=2 et:
