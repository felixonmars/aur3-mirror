# $Id$
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python2-zope-schema
pkgver=3.8.1
pkgrel=1
pkgdesc="zope.schema extension for defining data schemas"
license=('ZPL')
arch=('i686' 'x86_64')
url="http://www.zope.org/Products/ZopeSchema/"
depends=('python2')
replaces=('zope-schema')
conflicts=('zope-schema')
source=(http://pypi.python.org/packages/source/z/zope.schema/zope.schema-${pkgver}.zip)
md5sums=('dc7639db9f8c08fac0fd42db9c8cb9b9')

build() {
  cd ${srcdir}/zope.schema-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
  # Blabla.
  rm $pkgdir/usr/lib/python2.7/site-packages/zope/schema/README*.txt
}
