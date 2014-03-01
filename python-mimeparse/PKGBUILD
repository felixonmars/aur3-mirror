# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=python-mimeparse
pkgver=0.1.4
pkgrel=1
pkgdesc='Module of basic functions for parsing mime-type names and matching them against a list of media-ranges'
arch=('any')
url="https://github.com/dbtsai/python-mimeparse"
license=('MIT')
depends=('python')
source=("http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root "${pkgdir}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('1d2816a16f17dcfe0c613da611fe7e13')
