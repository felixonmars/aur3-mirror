# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=camp
pkgver=0.7.1
pkgrel=1
pkgdesc="C++ multi-purpose reflection library"
arch=('i686' 'x86_64')
url="http://dev.tegesoft.com/projects/${pkgname}/"
license=('LGPL')
depends=('boost')
makedepends=('cmake')
optdepends=('doxyen: generate API docs')
source=("http://dev.tegesoft.com/attachments/download/79/${pkgname}-${pkgver}-src.tar.bz2")
md5sums=('7b33a5aa39dda2a0aea1243652b43431')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"

  [[ -d build ]] && rm -r build
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
  # Check for optdepends and then attemt to generate docs
  if [[ $(which doxygen) ]]; then
    make doc
  else
    warning "doxygen not found, not making documentation"
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"

  cd build
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
