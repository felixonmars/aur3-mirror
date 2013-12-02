# Maintainer: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=c99-to-c89
pkgver=1.0.2
pkgrel=1
pkgdesc='Tool to convert C99 code to MSVC-compatible C89'
arch=('i686' 'x86_64')
url="https://github.com/rbultje/c99-to-c89"
license=('Apache')
depends=('clang')
makedepends=('git')
source=(git://github.com/libav/c99-to-c89#tag=release-$pkgver)
md5sums=('SKIP')

build() {
  cd $pkgname
  make CC=clang LDFLAGS="$LDFLAGS -L/usr/lib/llvm"
}

package() {
  cd $pkgname
  install -Dm755 c99conv "$pkgdir"/usr/bin/c99conv
  install -Dm755 c99wrap "$pkgdir"/usr/bin/c99wrap
}
