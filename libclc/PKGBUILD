# Maintainer: Armin K. <krejzi at email dot com>

pkgname=libclc
pkgver=20130627
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('i686' 'x86_64')
url="http://libclc.llvm.org/"
license=('MIT')
depends=('clang')
makedepends=('git' 'python2')
source=("git://people.freedesktop.org/~tstellar/libclc.git#commit=a44a4d32ff12bf6826be528eca13259d839b78d6")
md5sums=(SKIP)

build() {
  cd ${pkgname}
  python2 ./configure.py --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  make install DESTDIR="$pkgdir"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

