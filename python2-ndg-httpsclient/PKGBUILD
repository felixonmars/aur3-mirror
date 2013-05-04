# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
pkgname=python2-ndg-httpsclient
_pkgname=ndg_httpsclient
pkgver=0.3.2
pkgrel=1
pkgdesc="Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL"
arch=(any)
url="https://pypi.python.org/pypi/ndg-httpsclient"
license=('BSD')
depends=('python2' 'python2-pyasn1')
makedepends=('python2-distribute')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/n/ndg-httpsclient/${_pkgname}-${pkgver}.tar.gz)
md5sums=('076303c7aa0e41f3b45a7cb43dbb0743')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

