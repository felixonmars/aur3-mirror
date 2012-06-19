# Maintainer: kfgz <kfgz at interia pl>

pkgname=kdtree
pkgver=0.5.6
pkgrel=1
pkgdesc="A simple, easy to use C library for working with kd-trees."
url="http://code.google.com/p/kdtree/"
license=('BSD')
arch=(i686 x86_64)
source=(http://kdtree.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('7a7d0c4f42f23408e547f74c92d1c2dd')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  sed -i "s/O3/O2/g" Makefile.in
  sed -i "s/O3/O2/g" configure
  ./configure
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -dm755 "${pkgdir}"/usr/{lib,include,share/doc/kdtree}
  install -m644 kdtree.h "${pkgdir}"/usr/include/
  install -m755 libkdtree.so "${pkgdir}"/usr/lib/
  install -m644 libkdtree.a "${pkgdir}"/usr/lib/
  install -m644 doc/guide.html "${pkgdir}"/usr/share/doc/kdtree/
}
