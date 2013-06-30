# Maintainer: Armin K. <krejzi at email dot com>
# Contributor: Jianjun Mao <justmao945_at_gmail.com>

pkgname=libcxx
pkgver=3.3
pkgrel=2
pkgdesc="A new implementation of the C++ standard library targeting C++0X."
arch=('i686' 'x86_64')
url="http://libcxx.llvm.org/"
license=('MIT')
depends=('gcc-libs')
optdepends=('gcc: ABI library libsupc++')
makedepends=('clang' 'cmake' 'git')
source=("http://llvm.org/releases/3.3/${pkgname}-${pkgver}.src.tar.gz")
md5sums=('59006e659ffb33f5222a7b79d4cd071e')
install=libcxx.install

build() {
  rm -rf ${pkgname}-build
  mkdir ${pkgname}-build
  cd ${pkgname}-build

  export GCC_VERSION=$(pacman -Q gcc | sed 's/.* \(.*\)-.*/\1/')

  if [ ${CARCH} == "i686" ]; then
     export GCC_PLATFORM=i686-pc-linux-gnu
  else
     export GCC_PLATFORM=x86_64-unknown-linux-gnu
  fi

  export LIBSUPCXX_INCLUDES="/usr/include/c++/${GCC_VERSION}/;/usr/include/c++/${GCC_VERSION}/${GCC_PLATFORM}/"

  export CC=clang
  export CXX=clang++

  cmake ${srcdir}/${pkgname}-${pkgver}.src \
        -DCMAKE_INSTALL_PREFIX=/usr  \
        -DCMAKE_BUILD_TYPE=Release \
        -DLIBCXX_CXX_ABI=libsupc++ \
        -DLIBCXX_LIBSUPCXX_INCLUDE_PATHS="${LIBSUPCXX_INCLUDES}"
  make
}

package() {
  cd ${pkgname}-build

  make install DESTDIR="${pkgdir}"

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}.src/LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

