# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=midicomp
pkgver=0.0.4
pkgrel=2
pkgdesc="Midicomp is a midi-to-text converter and vice versa."
arch=('i686' 'x86_64')
url="http://midicomp.opensrc.org/"
license=('GPL')
depends=("glibc")
source=("http://midicomp.opensrc.org/$pkgname-$pkgver.tar.gz")
md5sums=('bdf6dd382ed99e45acefd3510c06683e')

build() {

  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {

  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install -Dm 755 midicomp "$pkgdir/usr/bin"
}
