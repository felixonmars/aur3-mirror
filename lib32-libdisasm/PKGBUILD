# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
_pkgbasename=libdisasm
pkgname=lib32-$_pkgbasename
pkgver=0.23
pkgrel=1
pkgdesc="a disassembler library."
arch=('i686' 'x86_64')
url="http://bastard.sourceforge.net/libdisasm.html"
license=('custom:Artistic')
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/project/bastard/$_pkgbasename/$pkgver/$_pkgbasename-$pkgver.tar.gz")
md5sums=('fc813fae8fceca92c2e40dac1da69041')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --build=x86_64-unknown-linux-gnu \
    --target=x86_64-unknown-linux-gnu
  make
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
