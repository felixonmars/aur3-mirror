# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-pki
pkgver=0.3.2
pkgrel=1
pkgdesc="Toolkit to manage X509 certificates and RSA keys"
arch=(any)
url="http://pypi.python.org/pypi/pki/0.3.2"
license=("MIT")
depends=('python2' 'python-m2crypto')
makedepends=()
optdepends=()
options=()
source=("http://pypi.python.org/packages/source/p/pki/pki-$pkgver.zip")
md5sums=('f268454d4216b3daebfc4a526a489304')

package() {
  cd ${srcdir}/pki-${pkgver}

  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
