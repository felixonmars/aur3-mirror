# Maintainer: Damien Churchill <damoxc@gmail.com>

_name=Chameleon
pkgname=python3-chameleon
pkgver=2.11
pkgrel=1
pkgdesc="XML-based template compiler."
license=('custom:BSD')
arch=('i686' 'x86_64')
url="http://chameleon.repoze.org"
depends=('python')
source=(http://pypi.python.org/packages/source/C/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('df72458bf3dd26a744dcff5ad555c34b')

build() {
  cd ${srcdir}/${_name}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
