# Maintainer : Damien Churchill <damoxc@gmail.com>

pkgname=python2-repoze.who
_pkgname=repoze.who
pkgver=2.0a4
pkgrel=1
pkgdesc="repoze.who is an identification and authentication framework for WSGI."
license=('custom:BSD')
arch=('i686' 'x86_64')
url="http://www.repoze.org"
depends=('python2' 'python-paste' 'zope-interface')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('235ae5578a943d993594f1e7591ea32e')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
