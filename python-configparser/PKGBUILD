# Maintainer: M0Rf30

pkgname=python-configparser
pkgver=3.5.0b2
pkgrel=1
pkgdesc="Brings the updated configparser from Python 3.2+ to Python 2.6-2.7"
arch=('any')
url="https://bitbucket.org/ambv/configparser"
depends=('python2')
makedepends=('python-setuptools')
license=('MIT')
options=(!libtool)
source=(https://pypi.python.org/packages/source/c/configparser/configparser-${pkgver}.tar.gz license)

build() {
  cd "${srcdir}"/configparser-${pkgver}

  python2 setup.py build
}

package() {
  cd "${srcdir}"/configparser-${pkgver}

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -D "${srcdir}"/license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('ad2a71db8bd9a017ed4735eac7acfa07'
         'f8e5b03556ed846d7681bacd4126f484')
