# $Id$
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=zope-schema
pkgver=3.7.1
pkgrel=1
pkgdesc="zope.schema extension for defining data schemas"
license=('ZPL')
arch=('i686' 'x86_64')
url="http://www.zope.org/Products/ZopeSchema/"
depends=('python2')
source=(http://pypi.python.org/packages/source/z/zope.schema/zope.schema-${pkgver}.tar.gz)
md5sums=('ca6e6a3555562bbc96d69e7447b47248')

build() {
  cd ${srcdir}/zope.schema-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
  # Blabla.
  rm $pkgdir/usr/lib/python2.7/site-packages/zope/schema/README*.txt
}
