# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=gcm-clerk
pkgname=python-${_pkgname}
pkgver=0.1.5
pkgrel=1
pkgdesc="Python client for Google Cloud Messaging for Android (GCM)"
arch=('any')
url="https://github.com/geeknam/python-gcm"
license=('custom')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

build() {
  cd ${_pkgname}-$pkgver
  python setup.py build
}

package() {
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('d63eea232f2fcd7b5c5cde31bf92526f5a79c1e1fe5c86409afb02bc30f907ec71577797c10da0cbdc36271a77f26d2f3d5d710b4af01c8ab4d91a1fd48a572c')
