# $Id$
# Maintainer : Felix Yan <felixonmars@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname='pypy-zope-interface'
pkgver=4.1.2
pkgrel=1
license=('ZPL')
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/zope.interface"
makedepends=('pypy-setuptools')
source=("http://pypi.python.org/packages/source/z/zope.interface/zope.interface-${pkgver}.tar.gz")
md5sums=('04298faeaa70b4f3b23fa2ae8987262c')

build() {
  cd "${srcdir}/zope.interface-${pkgver}"
  pypy setup.py build
}

check() {
  cd "${srcdir}/zope.interface-${pkgver}"
  pypy setup.py test
}

package() {
  pkgdesc=('Zope Interfaces for PyPy')
  depends=('pypy')
 
  cd "${srcdir}/zope.interface-${pkgver}"
  pypy setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
#  cp src/zope/__init__.py "${pkgdir}/usr/lib/python3.4/site-packages/zope/"
}
