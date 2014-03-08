# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-pycrypto"
pkgver=2.6.1
pkgrel=1
pkgdesc="Cryptographic modules for Python"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/pycrypto"
license=("Apache")

depends=()

source=("https://pypi.python.org/packages/source/p/pycrypto/pycrypto-${pkgver}.tar.gz")
md5sums=("55a61a054aa66812daf5161a0d5d7eda")

package() {
  cd "${srcdir}/pycrypto-${pkgver}/"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}