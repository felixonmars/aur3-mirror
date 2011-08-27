# Maintainer: Damien Churchill <damoxc@gmail.com>

_name=Chameleon
pkgname=python-chameleon
pkgver=1.2.13
pkgrel=1
pkgdesc="XML-based template compiler."
license=('custom:BSD')
arch=('i686' 'x86_64')
url="http://chameleon.repoze.org"
depends=('python2')
source=(http://pypi.python.org/packages/source/C/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('96083adf83d0e1f9315fb3afbd2619b9')

build() {
  cd ${srcdir}/${_name}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
