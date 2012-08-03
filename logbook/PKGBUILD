# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Tomas Schertel<tschertel@gmail.com>

pkgname=logbook
_dlpkgname=Logbook
pkgver=0.3
pkgrel=1
pkgdesc="logging sytem for Python that replaces the standard library’s logging module"
arch=(any)
url="http://packages.python.org/Logbook/index.html"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/L/Logbook/${_dlpkgname}-${pkgver}.tar.gz")
md5sums=('f6db00f52bd4629b154c205252461719')

build() {
  cd ${srcdir}/${_dlpkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir}
}
