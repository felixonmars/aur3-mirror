# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kpar2kde4
pkgver=0.4.5
pkgrel=2
pkgdesc="PAR2 verification and repair program for KDE4"
arch=('i686' 'x86_64')
url="http://code.google.com/p/kpar2kde4/"
license=('GPL3')
depends=('kdebase-runtime' 'libpar2' 'libsigc++2.0')
makedepends=('cmake' 'automoc4')
source=("http://kpar2kde4.googlecode.com/files/kpar2-${pkgver}.tar.gz")
md5sums=('edfa8ebb8da3a9388f6f8fb9a17135d5')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=${pkgdir} install
}
