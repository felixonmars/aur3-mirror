# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=jieba
pkgname=python3-$_pkgname
pkgver=0.20
pkgrel=1
pkgdesc="JieBa Chinese Words Segment Library based on HMM model for Python"
arch=('any')
url=('https://github.com/fxsjy/jieba')
license=("MIT")
depends=('python3')
source=("http://pypi.python.org/packages/source/j/$_pkgname/$_pkgname-$pkgver.zip")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir"
}
md5sums=('b30fb329eb0e9c82a9c0868e6580ab98')
