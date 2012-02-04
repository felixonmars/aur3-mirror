# Maintainer: Damien Churchill <damoxc@gmail.com>

pkgname=zope-i18nmessageid
pkgver=3.5.3
pkgrel=1
pkgdesc="Message Identifiers for internationalization"
license=('ZPL')
arch=('i686' 'x86_64')
url="http://www.zope.org/"
depends=('python2')
source=(http://pypi.python.org/packages/source/z/zope.i18nmessageid/zope.i18nmessageid-${pkgver}.tar.gz)
md5sums=('cb84bf61c2b7353e3b7578057fbaa264')

build() {
  cd ${srcdir}/zope.i18nmessageid-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
