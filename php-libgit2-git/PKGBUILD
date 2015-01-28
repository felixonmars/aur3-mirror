# Maintainer: mibbio <contact at mibbiodev dot de>

pkgname=php-libgit2-git
pkgver=v0.2.1.r367.g2e3bd50
pkgrel=1
pkgdesc="PHP bindings for libgit2 (php-git)"
url="https://github.com/libgit2/php-git"
license="MIT"
arch=('i686' 'x86_64')
depends=('php' 'libgit2')
conflicts=('php-libgit2')
makedepends=('php' 'git' 'cmake')
source=("${pkgname}::git+https://github.com/libgit2/php-git#branch=develop")
md5sums=('SKIP')
install=('php-libgit2.install')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init && git submodule update
}

build() {
  # build submodule
  cd "${srcdir}/${pkgname}"
  mkdir libgit2/build
  cd libgit2/build
  if [[ "${CARCH}" == "x86_64" ]]; then
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DBUILD_CLAR=OFF -DCMAKE_C_FLAGS=-fPIC ..
  else
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DBUILD_CLAR=OFF ..
  fi
  cmake --build .

  # build php-libgit2
  cd "${srcdir}/${pkgname}"
  phpize
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  NO_INTERACTION=1 make test
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}/" install
}
