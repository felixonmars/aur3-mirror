# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=wxmotif2.8
pkgver=2.8.12
pkgrel=2
pkgdesc="wxWidgets is a C++ library that lets developers create applications for Windows, OS X, Linux and UNIX"
arch=('i686' 'x86_64')
url="http://www.wxwidgets.org/"
license=('wxWindows')
depends=('openmotif' 'libpng' 'libjpeg' 'libtiff')
provides=('wxmotif')
conflicts=('wxgtk')
source=("http://downloads.sourceforge.net/project/wxwindows/${pkgver}/wxMotif-${pkgver}.tar.bz2")

build() {
  rm -rf build
  mkdir build
  cd build

  # upstream suggested that sometimes configuring in same dir as source causes build errors :S
  ../wxMotif-${pkgver}/configure \
    --with-motif \
    --disable-shared \
    --prefix=/usr

  make
}

package() {
  cd build

  make DESTDIR=${pkgdir} install
}
md5sums=('f6cb5723a7252c5339d1be3a97dd0dde')
