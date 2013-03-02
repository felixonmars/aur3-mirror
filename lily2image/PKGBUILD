# Maintainer: Bernardo Barros <bernardobarros@NOSPAM.gmail.com>

pkgname=lily2image
pkgver=200902
pkgrel=2
pkgdesc="Script for making image files from lilypond source suitable for use as musical examples to insert in a document or web page."
arch=('any')
url="https://code.google.com/p/lily2image"
license=('GPL')
depends=('bash' 'netpbm')
source=("https://lily2image.googlecode.com/files/${pkgname}")
md5sums=('47894772bae9e4eca92c1229d8b1b296')

# build() {
#   cd "$srcdir/$pkgname-$pkgver"
#   ./configure --prefix=/usr
#   make
# }

# check() {
#   cd "$srcdir/$pkgname-$pkgver"
#   make -k check
# }

package() {

  mkdir -p "$pkgdir/usr/bin/"
  install -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:

