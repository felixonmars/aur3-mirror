# Maintainer: /dev/rs0 <rs0@secretco.de.com>

_pkgname="killerbee"

pkgname="${_pkgname}-svn"
pkgver=88
pkgrel=1
pkgdesc="Framework and tools for exploiting ZigBee and IEEE 802.15.4 networks."

provides=(${_pkgname})

arch=('any')
license=('BSD')
url="https://code.google.com/p/${_pkgname}"

depends=('python2' 'python2-crypto' 'python2-pyusb')
makedepends=('svn')

source=("svn+http://${_pkgname}.googlecode.com/svn/trunk")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/trunk
  svnversion | tr -d [A-z]
}

package() {
  cd ${srcdir}/trunk/${_pkgname}

  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' tools/*

  python2 setup.py install --root=${pkgdir} --optimize=1
}
