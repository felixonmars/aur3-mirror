# Maintainer: Mildred Ki'Lya <mildred.fr>
pkgname=cheerp-llvm-clang-git
pkgver=20141020131023
pkgrel=1
pkgdesc="LLVM infrastructure including clang and cheerp support"
url="http://leaningtech.com/duetto/"
arch=('x86_64' 'i686')
license=()
depends=()
optdepends=()
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
install=
source=("git://github.com/leaningtech/cheerp-llvm" "git://github.com/leaningtech/cheerp-clang")
md5sums=(SKIP SKIP)

pkgver() {
  date +%Y%m%d%H%M%S
}

build() {
  ln -s ../../cheerp-clang "${srcdir}/cheerp-llvm/tools/clang"
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake "${srcdir}/cheerp-llvm" -DCMAKE_INSTALL_PREFIX=/opt/cheerp
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
