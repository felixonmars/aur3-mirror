# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=listener
pkgver=2.0.1
pkgrel=1
pkgdesc="Listens for sound and starts recording until the sound stops."
arch=(i686 x86_64)
url="http://www.vanheusden.com/listener/"
license=('GPL')
depends=('ncurses' 'portaudio')
backup=("etc/$pkgname.conf")
source=("$url$pkgname-$pkgver.tgz")
md5sums=('c793da01635e25ec04b87d3ed83d359d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i "s|/usr/local||" Makefile $pkgname.h manual.html
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bins
  install -Dm755 $pkgname \
    "$pkgdir/usr/bin/$pkgname"
  install -Dm755 set$pkgname \
    "$pkgdir/usr/bin"

  # conf
  install -Dm644 $pkgname.conf \
    "$pkgdir/etc/$pkgname.conf"

  # doc
  install -Dm644 manual.html \
    "$pkgdir/usr/share/doc/$pkgname/manual.html"
}

# vim:set ts=2 sw=2 et:
