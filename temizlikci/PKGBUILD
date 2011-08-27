# Maintainer: Dan Serban

pkgname=temizlikci
pkgver=0.5.1
pkgrel=1
pkgdesc="A tool for cleaning your system and protecting your online privacy"
arch=(any)
url=http://code.google.com/p/temizlikci/
license=(GPLv3)
depends=(python2 qt)
makedepends=('python-distutils-extra')
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('d5a3fa054747b1bd47968c69032ebe64')

build()
{
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
  sed -i "s|#![ ]*/usr/bin/env python$|#!/usr/bin/python2|" $(find "${pkgdir}" -name '*.py')
  USRBINFILE="${pkgdir}"/usr/bin/${pkgname}
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo 'python2 /usr/lib/python2.7/site-packages/temizlikci/main.py' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
}
