# Contributor: bzt <unmacaque@gmail.com>

pkgname=exaile-plugin-mmkeys
pkgver=1
pkgrel=1
pkgdesc="This packages provides a library required by Exaile's XKeys plugin that allows to use multimedia keys."
arch=('i686' 'x86_64')
url="http://sacredchao.net/~piman/software/python.shtml"
license=('GPL2')
optdepends=('exaile' 'exaile-bzr')
makedepends=('python2' 'gtk2' 'pygtk')
source=(http://sacredchao.net/~piman/software/mmkeys-1.tar.gz)
md5sums=(f3a377523d2f3d7129af2c48e4c20716)

build() {
  cd ${srcdir}/
  cd mmkeys-${pkgver}/

  # use latest version of python2
  PYTHON_VER=`python2-config --includes | awk '{print $2}' | sed 's!-I!!'`
  sed -i "s!/usr/include/python2.3/!${PYTHON_VER}!g" Makefile
  # compiler flag
  sed -i 's!\(CFLAGS = .*\)!\1 -fPIC!g' Makefile

  make mmkeys.so
  mkdir -p ${pkgdir}/usr/lib/exaile
  install -m 644 ${srcdir}/mmkeys-${pkgver}/mmkeys.so ${pkgdir}/usr/lib/exaile
}

