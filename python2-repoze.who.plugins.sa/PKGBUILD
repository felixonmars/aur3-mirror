# Maintainer : Damien Churchill <damoxc@gmail.com>

pkgname=python2-repoze.who.plugins.sa
_pkgname=repoze.who.plugins.sa
pkgver=1.0rc2
pkgrel=2
pkgdesc="The repoze.who SQLAlchemy plugin"
license=('custom:BSD')
arch=('i686' 'x86_64')
url="http://www.repoze.org"
depends=('python2-repoze.who.plugins.sa')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('9ab86eea16810838a6e7922853cbc466')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1

  # Fix buggy setup.py
  rm -r ${pkgdir}/usr/lib/python2.7/site-packages/tests
}
