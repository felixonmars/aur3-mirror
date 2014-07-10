# Maintainer: Chris Clonch <chris at theclonchs dot com>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

# Current source for PKGBUILD can be found at
# https://github.com/cacack/pkgbuilds/tree/master/ccextractor

pkgname=ccextractor
pkgver=0.70
pkgrel=2
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="http://ccextractor.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=(
   http://downloads.sourceforge.net/ccextractor/$pkgname.src.$pkgver.zip
)
sha512sums=('299afe8ec3e361d777b01028e932b87275e60e30a2658e8a80c330b03a3a1b28a5a29c2a60630057d88087e216867f3a58c7a285c431b26bf2a490200d9b8113')

build() {
  cd "$srcdir/$pkgname.$pkgver/linux"
  ./build
}

package() {
  cd "$srcdir/$pkgname.$pkgver/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
