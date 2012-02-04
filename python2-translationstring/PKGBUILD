# Maintainer: Damien Churchill <damoxc@gmail.com>

pkgname=python2-translationstring
_pkgname=translationstring
pkgver=0.4
pkgrel=1
pkgdesc="Utility library for i18n relied on by various Repoze packages"
license=('custom:BSD')
arch=('i686' 'x86_64')
url="http://www.repoze.org"
depends=('python2')
source=(http://pypi.python.org/packages/source/t/translationstring/translationstring-${pkgver}.tar.gz)
md5sums=('392287923c475b660b7549b2c2f03dbc')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
