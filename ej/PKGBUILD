# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=ej
pkgver=0.2
pkgrel=1
pkgdesc="Simple gtk DejaVu format viewer."
arch=(i686 x86_64)
url="http://plhk.ru/"
license=('GPL')
depends=('djvulibre' 'gtk2')
source=("${url}static/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7cee45b48e9555918afd238ff8e70ef2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # does not build with -Wl,--as-needed
  export LDFLAGS=${LDFLAGS/-Wl,--as-needed}

  make LOCALBASE=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # install bin
  install -Dm755 ej "$pkgdir/usr/bin/ej"

  # install man
  install -Dm644 ej.1 "$pkgdir/usr/share/man/man1/ej.1"
}

# vim:set ts=2 sw=2 et:
