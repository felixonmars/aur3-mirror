# Contributer: fnord0 <fnord0 AT riseup DOT net>

pkgname=python-pefile
_pkgname=pefile
pkgver=1.2.10_123
pkgrel=1
pkgdesc="a Python module to read and work with PE (Portable Executable) files"
arch=('any')
url="http://code.google.com/p/pefile/"
license=('MIT')
depends=('python2')
source="http://pefile.googlecode.com/files/${_pkgname}-${pkgver//_/-}.tar.gz"
md5sums=('97f69dc18c8c33d169537291a75fe9e5')

package() {
  grep -rl python ${srcdir}/${_pkgname}-${pkgver//_/-} | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|g' || return 1
  cd ${srcdir}/${_pkgname}-${pkgver//_/-}
  python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1
}
