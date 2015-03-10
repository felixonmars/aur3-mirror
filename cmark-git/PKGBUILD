# Maintainer: Nathan Typanski <ndt@nathantypanski.com>
# Contributor: sgelb

_srcname=cmark
pkgname=cmark-git
pkgver=r1439.fb68ad1
pkgrel=1
pkgdesc="CommonMark to HTML converter program and library"
arch=('i686' 'x86_64')
url="https://github.com/jgm/CommonMark.git"
license=('custom:bsd3')
makedepends=('git' 'cmake' 're2c')
options=(!emptydirs libtool)
source=('cmark::git+https://github.com/jgm/cmark.git#branch=master')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "${_srcname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_srcname}"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" ..
  make
}

package() {
  cd "${_srcname}/build"
  make install
  install -D -m644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

