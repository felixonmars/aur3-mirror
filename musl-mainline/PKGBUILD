# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: TJ Vanderpoel <tj@rubyists>

pkgname=musl-mainline
pkgver=1.1.4
pkgrel=1
pkgdesc='Lightweight implementation of C standard library'
arch=('i686' 'x86_64')
url='http://www.musl-libc.org/'
license=('MIT')
source=(http://www.musl-libc.org/releases/musl-$pkgver.tar.gz)
optdepends=('bash: for musl-gcc')
provides=('musl')
conflicts=('musl')
options=('staticlibs')
md5sums=('f18f3bdbe088438cd64a5313c19a7312')

build() {
  cd musl-$pkgver
  ./configure --prefix=/usr/musl \
    --exec-prefix=/usr \
    --libdir=/usr/musl/lib
  make
}

package() {
  cd musl-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -d "$pkgdir"/usr/lib/
  mv "$pkgdir"/lib/ld-musl*.so* "$pkgdir"/usr/lib/
  rmdir "$pkgdir"/lib
}
