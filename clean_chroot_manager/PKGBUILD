# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='clean_chroot_manager'
pkgver=2.03
pkgrel=1
pkgdesc='Wrapper script for managing clean chroots.'
arch=('any')
url='https://github.com/graysky2/clean_chroot_manager'
license=('MIT')
depends=('devtools')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('2b50234309cb0bc9b65d89939d45207f17e15219307385ecb7f0d5b5098d7232')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
