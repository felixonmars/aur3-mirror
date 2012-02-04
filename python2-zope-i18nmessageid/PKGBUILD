# Maintainer: Damien Churchill <damoxc@gmail.com>

pkgname=python2-zope-i18nmessageid
pkgver=3.6.1
pkgrel=1
pkgdesc="Message Identifiers for internationalization"
license=('ZPL')
arch=('i686' 'x86_64')
url="http://www.zope.org/"
depends=('python2')
replaces=('zope-i18nmessageid')
conflicts=('zope-i18nmessageid')
source=(http://pypi.python.org/packages/source/z/zope.i18nmessageid/zope.i18nmessageid-${pkgver}.tar.gz)
md5sums=('6716cd769c006b5e90af030f83592600')

build() {
  cd ${srcdir}/zope.i18nmessageid-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
