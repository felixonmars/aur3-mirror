# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python2-pystorm
_pkgname=pystorm
pkgver=git20130426091936
_realver=0.1+${pkgver}
pkgrel=1
arch=('any')
url="http://linuxdeepin.com/"
license=('GPL3')
pkgdesc="Python Storm is download library and tool for Linux Deepin project."
depends=('python2' 'python2-gevent')
makedepends=('python2-setuptools' 'intltool')
source=("http://packages.linuxdeepin.com/deepin/pool/main/p/${_pkgname}/${_pkgname}_${_realver}.tar.gz")
sha256sums=('ed5169a3a534dacc6c42f8dfc0a50084d10af20484693e0cb63cff51ca0fe501')

prepare() {
  cd $srcdir/${_pkgname}-${_realver}

  sed -i 's|^#!.*python$|#!/usr/bin/python2|' \
  {examples/*.py,gdist/*.py,pystorm/*.py,tools/*.py,setup.py}
}

package() {
  cd $srcdir/${_pkgname}-${_realver}
  python2 setup.py install --root=$pkgdir
}
