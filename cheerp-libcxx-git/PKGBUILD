# Maintainer: Mildred Ki'Lya <mildred.fr>
pkgname=cheerp-libcxx-git
pkgver=20141020144814
pkgrel=1
pkgdesc="A cheerp enabled libc++ implementation"
url="http://leaningtech.com/duetto/"
arch=('x86_64' 'i686')
license=()
depends=()
optdepends=()
makedepends=('cmake' 'cheerp-llvm-clang-git' 'cheerp-utils-git' cheerp-newlib-git)
conflicts=()
replaces=()
backup=()
install=
source=("git://github.com/leaningtech/${pkgname%-git}" git://github.com/leaningtech/cheerp-libcxxabi)
md5sums=(SKIP SKIP)

pkgver() {
  date +%Y%m%d%H%M%S
  #cd "${pkgname%-git}"
  #git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_PREFIX=/opt/cheerp -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=/opt/cheerp/share/cmake/Modules/CheerpToolchain.cmake -DLIBCXX_ENABLE_SHARED=OFF  -DLIBCXX_LIBCXXABI_INCLUDE_PATHS="${srcdir}/cheerp-libcxxabi/include" -DLIBCXX_CXX_ABI=libcxxabi "${srcdir}/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
