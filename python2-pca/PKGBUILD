# Contributor: Fabio Zanini <fabio.zanini@fastmail.fm>

pkgname=python2-pca
pkgver=1.1.02
pkgrel=2
pkgdesc="Principal Component Analysis module for Python2"
arch=('any')
url="http://folk.uio.no/henninri/pca_module"
license=('Apache')
depends=('python2' 'python2-numpy' 'python2-scipy')
makedepends=('python2-distribute' 'unrar')
source="http://folk.uio.no/henninri/pca_module/pca_module-$pkgver.rar"
md5sums=('323e1d31991488b932cbf007f9f85cc6')

build() {
  cd ${srcdir}
  unrar x -y pca_module-$pkgver.rar

  cd ${srcdir}/pca_module-$pkgver

  # Python2 compatibility
  for file in $(find $srcdir -name '*.py' -print); do
      sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
      sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  # Abandon old Numeric compatibility in favour of numpy
  sed -i 's/^old_numeric = True/old_numeric = False/' setup.py
  sed -i 's/^add_ext = True/add_ext = False/' setup.py

  python2 setup.py build
}

package() {
  cd ${srcdir}/pca_module-$pkgver
  python2 setup.py install --root=${pkgdir}
}
