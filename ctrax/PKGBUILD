#Submitter Giorgio Gilestro <giorgio@gilest.ro>
pkgname=ctrax
_pkgname=Ctrax
pkgver=0.5.5
pkgrel=1
pkgdesc="Ctrax - The Caltech Multiple Walking Fly Tracker"
url="http://ctrax.sourceforge.net/"
arch=('any')
license=('MIT')
depends=('python2' 'wxpython' 'python2-numpy' 'python2-scipy' 'python-imaging' 'python2-matplotlib' 'cython2' 'motmot.imops' 'motmot.ufmf' 'motmot.wxglvideo' 'motmot.wxvideo' 'motmot.wxvalidatedtext')
makedepends=('python2' 'python2-distribute')
source=(http://downloads.sourceforge.net/project/ctrax/Ctrax%20source/Ctrax-$pkgver.tar.gz)
md5sums=('74ae8638d0c1011823a42e6a86b811ba')

build() {
  cd ${srcdir}/$_pkgname-$pkgver
  #sed -i 's|#!python|#!/usr/bin/env python2|' distribute_setup.py
  python2 setup.py build
}
package() {
  cd ${srcdir}/$_pkgname-$pkgver
  python2 setup.py install --root="${pkgdir}" -O1
}
