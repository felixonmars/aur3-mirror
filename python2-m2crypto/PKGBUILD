pkgname=python2-m2crypto
_pkgname=python-m2crypto
pkgver=0.21.1
pkgrel=1
pkgdesc="M2Crypto is a crypto and SSL toolkit for Python"
arch=('i686' 'x86_64')
url="http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
license=('custom')
depends=('python2' 'openssl')
makedepends=('python2' 'swig')
provides=('python2-m2crypto')
conflicts=()
optdepends=()
source=(http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${pkgver}.tar.gz)
md5sums=('f93d8462ff7646397a9f77a2fe602d17')

build() {
  cd "${srcdir}/M2Crypto-${pkgver}"
  python setup.py build
	python setup.py test
}

package()
{
  cd "${srcdir}/M2Crypto-${pkgver}"
	python setup.py install --prefix=/usr --root=${pkgdir}
}
