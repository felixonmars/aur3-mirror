# Maintainer: Luis Sarmiento < lgsarmientop-ala-unal.edu.co >

pkgname=hdtv
pkgver=0.3.6
pkgrel=2
pkgdesc="A proposed successor to TV developed at IKP, Köln, Germany"
url="https://www.ikp.uni-koeln.de/projects/hdtv/trac/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('root' 'mfile')
options=('!emptydirs')

source=("http://www.ikp.uni-koeln.de/src/${pkgname}/${pkgname}-${pkgver}.tgz"
	"MFile_cxx.patch")
md5sums=('d3a6f95502a84849925c90e45b772530'
         'f19ffee9fe6f0c277b2952b465b587fc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  msg 'python2 switch'
  find . -type f -exec sed -e 's_#!/usr/bin/python_&2_' \
    -e 's_python _&2_' \
    -e 's_#!/usr/bin/env python_&2_' \
    -e 's/python -O/python2 -O/g' \
    -e 's/python -c/python2 -c/g' -i {} \;

  cd ${srcdir}/${pkgname}-${pkgver}/src/mfile-root
  patch -Np4 < ${srcdir}/MFile_cxx.patch
  cd ${srcdir}/${pkgname}-${pkgver}/src/
  make clean
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
