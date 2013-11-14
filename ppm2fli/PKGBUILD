# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=ppm2fli
pkgver=2.1
pkgrel=1
pkgdesc="Generate FLI(C) animations form a series of images or extract them"
url="http://vento.pi.tu-berlin.de/ppm2fli/main.html"
arch=('x86_64' 'i686')
license=('GPL2')
source=("http://vento.pi.tu-berlin.de/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('c5c9c20eb26e4d4ae1e180852733eac6')
sha256sums=('7c4e9ed288a5be356c272f5c81e1106f26c7e06965371bb434fdb02e30ce4a1c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # add our cflags
  sed 's/CFLAGS=/CFLAGS+=/' -i Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # create folders
  install -d "$pkgdir/usr/"{bin,share/man/man1}

  # install binary
  install -m755 {ppm2fli,unflick} "$pkgdir/usr/bin/"

  # install manual
  install -m644 {ppm2fli,unflick}.1 "$pkgdir/usr/share/man/man1/"
  gzip "$pkgdir/usr/share/man/man1/"{ppm2fli,unflick}.1
}
