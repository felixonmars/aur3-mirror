# Maintainer : Damien Churchill <damoxc@gmail.com>

pkgname=pyramid_handlers
pkgver=0.1
pkgrel=1
pkgdesc="Pyramid handlers emulate Pylons 1 controllers"
license=('custom:BSD')
arch=('i686' 'x86_64')
url="http://docs.pylonsproject.org"
depends=('python2' 'pyramid' 'pyramid_zcml')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('5707923d670e1401d61a168d8cb595bc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
