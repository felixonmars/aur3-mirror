# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=konsole-multi-terminal
pkgver=20130210
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/vincepii/konsole-multi-terminal'
pkgdesc="Terminal"
license=('GPL')
groups=('kde')
depends=('kdebase-runtime' 'kdebase-lib')
conflicts=('kdebase-konsole')
provides=('kdebase-konsole')
makedepends=('cmake' 'automoc4')
source=("git+https://github.com/vincepii/konsole-multi-terminal.git")
sha1sums=('SKIP')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../konsole-multi-terminal \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
