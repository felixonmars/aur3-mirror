# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=apns-clerk
pkgname=python-${_pkgname}
pkgver=0.1.2
pkgrel=1
pkgdesc="Python client for Apple Push Notification Service for iOS (APNS)"
arch=('any')
url="https://github.com/geeknam/python-gcm"
license=('custom')
depends=('python' 'python-pyopenssl')
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

sha512sums=('fe68521a0fde636b6c3e3d385427bc2d12b99bb815296d7dd02665c5083195d2a089ae524c12f74a2bc5157a876e40c94e35860b3bbb057d92107172709e3daa')
