pkgname=ifdnfc
pkgrel=1
pkgver=r61.c25902f
pkgdesc="IFDHandler for PC/SC to bring support of all libnfc-compatible readers to the PC/SC stack"
arch=('i686' 'x86_64')
url="https://code.google.com/p/ifdnfc/"
license=('GPL')
depends=('libnfc')
makedepends=()
source=("git+https://code.google.com/p/ifdnfc/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -vfi
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

