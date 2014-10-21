# Maintainer: Mildred Ki'Lya <mildred.fr>
pkgname=cheerp-newlib-git
pkgver=20141020144440
pkgrel=1
pkgdesc="A cheerp enabled libc implementation"
url="http://leaningtech.com/duetto/"
arch=('x86_64' 'i686')
license=()
depends=()
optdepends=()
makedepends=('cheerp-llvm-clang-git' 'cheerp-utils-git')
conflicts=()
replaces=()
backup=()
install=
source=("git://github.com/leaningtech/${pkgname%-git}" git://github.com/leaningtech/cheerp-libcxx)
md5sums=(SKIP SKIP)

pkgver() {
  date +%Y%m%d%H%M%S
  #cd "${pkgname%-git}"
  #git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  "${srcdir}/${pkgname%-git}/newlib/configure" --host=cheerp --with-cxx-headers=$srcdir/cheerp-libcxx/include --prefix=/opt/cheerp
  make
  
  # build-bc-libs.sh
  for lib in libc libm; do
    mkdir -p build-bc-$lib
    cd build-bc-$lib
    ar x ../$lib/$lib.a
    /opt/cheerp/bin/llvm-link *.o -o $lib.bc
    cd ..
  done
}

package() {
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
  
  # build-bc-libs.sh
  for lib in libc libm; do
    cd build-bc-$lib
    cp -v $lib.bc ${pkgdir}/opt/cheerp/lib/$lib.bc
    cd ..
  done
}

# vim:set ts=2 sw=2 et:
