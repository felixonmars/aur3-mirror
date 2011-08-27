# Maintainer : Damien Churchill <damoxc@gmail.com>

pkgname=pyramid_zcml
pkgver=0.1
pkgrel=1
pkgdesc="Pyramid handlers emulate Pylons 1 controllers"
license=('custom:BSD')
arch=('i686' 'x86_64')
url="http://docs.pylonsproject.org"
depends=('python2' 'pyramid' 'python-paste-script')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('d4b4bdf7eedbb19a7dbcba071ab3b7a0')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
