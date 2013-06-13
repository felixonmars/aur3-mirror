# Maintainer: Sergey Vidyuk <sir.vestnik@gmail.com>

pkgname=qremotesignal
pkgver=1.3.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Qt4 signal slot based RPC library"
url='https://qremotesignal.googlecode.com'
license=('LGPL3')
depends=('qt4' 'qjson')
makedepends=('cmake' 'help2man' 'doxygen')
source=("https://qremotesignal.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=("0204f68189af31187cef361ae8227ce38022e387")

build() {
  mkdir build
  cd build
  cmake ${srcdir}/${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DQRS_DOCS=True \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

