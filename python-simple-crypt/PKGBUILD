# Maintainer: Pablo Lluch <pablo dot lluch at gmail dot com>

pkgname=python-simple-crypt
pkgver=3.0.0
pkgrel=1
arch=('any')
license=('custom')
pkgdesc="Simple, secure encryption and decryption for Python 3"
url="https://pypi.python.org/pypi/simple-crypt"
makedepends=('python-distribute')
depends=('python-crypto')
source=("https://pypi.python.org/packages/source/s/simple-crypt/simple-crypt-$pkgver.tar.gz" 
		"LICENSE")
md5sums=('e49a2f5609f9d8e9f5cfdd13dfa608f6' 
         '02dd4738d68b43d8bbea116ff3b3e1dd')

build() {
  cd "$srcdir/simple-crypt-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir"
  # Install public domain license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/" 
  cd "simple-crypt-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}