# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=beagle-lib
pkgver=1093
pkgrel=1
pkgdesc="A general purpose library for evaluating the likelihood of sequence evolution on trees."
arch=('i686' 'x86_64')
url="http://code.google.com/p/beagle-lib/"
license=('LGPL')
depends=('libltdl')
optdepends=('cuda-toolkit: for doing calculations on the GPU' 'openjdk6: for usage with BEAST')
makedepends=('svn')
source=('svn+http://beagle-lib.googlecode.com/svn/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "${SRCDEST}/trunk"
  svnversion | tr -d [A-z]
}

prepare() {
  #Unfortunately this package needs patching to build...
  cd ${srcdir}/trunk
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
}

build() {
  cd ${srcdir}/trunk
  ./autogen.sh
  ./configure --with-cuda=/opt/cuda-toolkit/ --prefix=/usr
  make
}

package() {
    cd ${srcdir}/trunk
    make DESTDIR=${pkgdir} install
}
