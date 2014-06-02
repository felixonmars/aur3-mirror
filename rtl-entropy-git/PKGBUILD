# Maintainer: trixpan

pkgname=rtl-entropy-git
pkgrel=1
pkgver=20140601
pkgdesc="rtl-entropy is software using rtl-sdr to turn your DVB-T dongle into a high quality entropy source"
arch=('x86_64')
url="http://rtl-entropy.org/"
license=('GPL')
depends=('rtl-sdr' 'libcap' 'openssl' 'pkg-config')
makedepends=('git' 'cmake')
source=('git://github.com/pwarren/rtl-entropy.git' 'CMakeLists.patch')
provides=('rtl-entropy')
sha256sums=('SKIP'
            'e4517d683d69048976e42e85d4fe38d28444a279360a85a77219ff86e83325a8')
_gitname=rtl-entropy

pkgver() {
    date +%Y%m%d
}

prepare() {
    cd "$srcdir/$_gitname"
    git apply "$srcdir/CMakeLists.patch"
}

build() {
  cd "${srcdir}/$_gitname"
  msg "Starting build..."
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -Wno-dev ../
  make
}

package() {
  cd "${srcdir}/$_gitname/build/"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
