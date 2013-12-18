# Maintainer: Damien Firmenich <fir.damien@gmail.com> 

pkgname=halide-git
pkgver=20131217
pkgrel=2
pkgdesc="A language for image processing and computational photography"
arch=('x86_64')
url="http://halide-lang.org/"
license=('MIT')
depends=('clang' 'llvm')
makedepends=('git')

source=('git+https://github.com/halide/Halide.git')
md5sums=('SKIP')

pkgver() {
  cd "Halide"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

# check() {
#   cd "$srcdir/Halide"
#   make run_tests
# }

build() {
  cd "$srcdir/Halide"
  make BUILD_PREFIX="/usr" distrib
}

package() {
  cd "$srcdir/Halide"
  mkdir -p "$pkgdir/usr/"
  tar -xf "distrib/usr/halide.tgz" -C "$pkgdir/usr/"
}
