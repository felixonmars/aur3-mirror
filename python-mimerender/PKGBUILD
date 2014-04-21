# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=python-mimerender
_pkgname=mimerender
pkgver=0.5.4
pkgrel=1
pkgdesc="Transparently select a render function for an HTTP request handler's result"
arch=('any')
url="https://github.com/martinblech/mimerender"
license=('MIT')
depends=('python' 'python-mimeparse>=0.1.4')
source=("https://github.com/martinblech/$_pkgname/archive/v$pkgver.tar.gz")

package() {
  cd $_pkgname-$pkgver
  python setup.py install -O1 --root "${pkgdir}"
}

sha512sums=('4616569bb73772ad02b481edfb90cdc1eb46b888241efed1726b1f6edcbaa6a9145d51450b2170e01121a20fa5407e9f5f415e0d5620875baddae17da60f0252')
