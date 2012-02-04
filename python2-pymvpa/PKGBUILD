# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=python2-pymvpa
pkgver=2.0.0
pkgrel=1
pkgdesc='PyMVPA is a Python module intended to ease pattern classification analyses of large datasets.'
arch=('i686' 'x86_64')
url='http://www.pymvpa.org/'
license=('custom:MIT')
depends=('python2-numpy' 'swig')
makedepends=('git')

build() {
  git clone git://github.com/PyMVPA/PyMVPA.git

  cd PyMVPA

  git checkout -b upstream/${pkgver}

  # python2 rename
  sed \
    -e 's_#!/usr/bin/env python_&2_' \
    -i mvpa2/tutorial_suite.py

  python2 setup.py build
}

package() {
  cd PyMVPA

  python2 setup.py install \
    --root=${pkgdir} \
    --optimize=1

  install -d ${pkgdir}/usr/share/licenses/python2-pymvpa
  install -m644 COPYING \
    ${pkgdir}/usr/share/licenses/python2-pymvpa
}
