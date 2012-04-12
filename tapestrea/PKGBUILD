# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=tapestrea
pkgver=0.1.0.6
pkgrel=1
pkgdesc="A set of new tools and techniques for sound design"
arch=(i686 x86_64)
url="http://taps.cs.princeton.edu/release/"
license=('GPL')
depends=('jack' 'freeglut' 'gtk2')
source=("${url}files/$pkgname-$pkgver.zip"
        "$pkgname-dso-and-gcc.patch")
md5sums=('e6bf295a3c83d78f020448c1e824dbe0'
         'f79d9bb3ae8220fa1d606795f4693e4f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # dso link and gcc 4.7 patch
  patch -p1 -i ../$pkgname-dso-and-gcc.patch

  cd src && make linux-jack
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"

  # bin
  install -Dm755 taps \
    "$pkgdir/usr/bin/taps"

  # examples (heavy)
#  install -d "$pkgdir/usr/share/$pkgname/examples"
#  cp -a ../examples "$pkgdir/usr/share/$pkgname/examples"
}

# vim:set ts=2 sw=2 et:
