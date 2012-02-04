# $Id$
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python2-zope-configuration
pkgver=3.7.4
pkgrel=2
pkgdesc="The zope configuration system provides an extensible system for supporting various kinds of configurations."
license=('ZPL')
arch=('i686' 'x86_64')
url="http://www.zope.org/Products/ZopeConfiguration/"
depends=('python2')
replaces=('zope-configuration')
conflicts=('zope-configuration')
source=(http://pypi.python.org/packages/source/z/zope.configuration/zope.configuration-${pkgver}.zip)
md5sums=('5b0271908ef26c05059eda76928896ea')

build() {
  cd ${srcdir}/zope.configuration-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
  # Blabla.
  rm $pkgdir/usr/lib/python2.7/site-packages/zope/configuration/README*.txt
}
