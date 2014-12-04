# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=wxmotif
pkgver=3.0.2
pkgrel=1
pkgdesc="wxWidgets is a C++ library that lets developers create applications for Windows, OS X, Linux and UNIX"
arch=('i686' 'x86_64')
url="http://www.wxwidgets.org/"
license=('wxWindows')
depends=('openmotif' 'libpng' 'libjpeg' 'libtiff')
conflicts=('wxgtk')
source=("http://downloads.sourceforge.net/project/wxwindows/${pkgver}/wxWidgets-${pkgver}.tar.bz2")

build() {
  rm -rf build
  mkdir build
  cd build

  # upstream suggested that sometimes configuring in same dir as source causes build errors :S
  ../wxWidgets-${pkgver}/configure \
    --with-motif \
    --disable-shared \
    --prefix=/usr

  make
}

package() {
  cd build

  make DESTDIR=${pkgdir} install
}
md5sums=('ba4cd1f3853d0cd49134c5ae028ad080')
