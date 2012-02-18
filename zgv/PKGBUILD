# Contributor: Igor Galic <i.galic[@@]gmail.com>
# Contributor: Stefan Husmann <stefan-husmann[@@]t-systems.de>
# Contributor: Marc D. Williams <wilmarcdw[@@]gmail.com>

pkgname=zgv
pkgver=5.9
pkgrel=5
arch=('i686' 'x86_64')
pkgdesc="A picture viewer with a thumbnail-based file selector, for the console - that uses SDL"
url="http://www.svgalib.org/rus/zgv/"
license=('GPL2')
install="$pkgname.install"
depends=('zlib' 'sdl' 'libpng' 'libjpeg-turbo' 'libtiff')
source=("http://www.svgalib.org/rus/zgv/$pkgname-$pkgver.tar.gz"
        'arch.patch' 'zgv_libpng15.patch')
sha256sums=('92e5d848fb51a77dc0ebb0ab383c1499c23aaff01f5445e9b0d75e067a8a64ba'
        'af6d6b6b49b91bbe396054eec557c0c87a4b3486003b52e81bdd5cdf9b2a20e8'
        'c2f6e9a33ea77424b99b501f46b14638bf160dc893f7b1cc89596796e442a473')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/arch.patch"
  patch -Np1 -i "$srcdir/zgv_libpng15.patch"

  for flags in {C,CXX,LD}FLAGS CC CXX; do
    [[ ${!flags} ]] && printf '%s = %s\n' "$flags" "${!flags}"
  done >> config.mk

  echo "ZGV_LIBS+=\$(LDFLAGS)" >> config.mk

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -m 0755 -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/info/zgv"
  make PREFIX="$pkgdir/usr" INFODIR="$pkgdir/usr/share/info/zgv" install
}

# vim:set ts=2 sw=2 et:
