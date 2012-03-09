# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=urbi-sdk
pkgver=2.7.5
pkgrel=1
pkgdesc='Urbi is an open-source software platform to control robots or complex systems in general.'
arch=('i686' 'x86_64')
url='http://www.gostai.com/products/urbi/'
license=('AGPL3')
depends=('boost' 'swig' 'ortp' 'python2')
makedepends=('gnuplot' 'java-environment')
checkdepends=('aspell-en' 'bc' 'socat' 'valgrind')
source=("http://www.gostai.com/downloads/urbi/${pkgver}/urbi-sdk-${pkgver}.tar.bz2")
md5sums=('30faf2d9533c8f7c1fb2ac2b674c6de7')

build() {
  cd urbi-sdk-${pkgver}

  msg 'updating files for python2 switch'
  find -type f -exec \
    sed \
      -e 's_/usr/bin/python_/usr/bin/python2_' \
      -e 's_/usr/bin/env python_/usr/bin/env python2_' \
      -i {} \;

  # need to update timestep for all files, otherwise bootstrap will have to get run
  find -type f -exec touch -t 01010101 {} \;

  # fix boost fs version and gcc 4.6 is now more strict, so don't error on warnings
  export CFLAGS="${CFLAGS} -DBOOST_FILESYSTEM_VERSION=2 -Wno-error"
  export CXXFLAGS="${CXXFLAGS} -DBOOST_FILESYSTEM_VERSION=2 -Wno-error"

  ./configure \
    --prefix=/usr \
    --enable-doc=no

  # fix java error
  # http://forum.gostai.com/viewtopic.php?f=26&t=4772&sid=9c3e00b18566dac0cdfe9fc74b22ea8c
  sed \
    -e 's_urbi/SoundUtilities.java__' \
    -e 's_urbi/MedianFilter.java__' \
    -e 's_urbi/SoundSampler.java__' \
    -e 's_urbi/ImageUtilities.java__' \
    -e 's_urbi/UMain.java__' \
    -e 's_urbi/SendSoundSampler.java__' \
    -i sdk-remote/src/swig/java/Makefile.in

  make
} 

# enable next package update
#check() {
#  cd urbi-sdk-${pkgver}
#
#  make check
#}

package() {
  cd urbi-sdk-${pkgver}

  make DESTDIR=${pkgdir} install
}
