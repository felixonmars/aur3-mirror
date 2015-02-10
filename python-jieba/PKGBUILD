# Maintainer: lilydjwg <lilydjwg@gmail.com>
# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=jieba3k
pkgname=python-jieba
pkgver=0.35.1
pkgrel=1
pkgdesc="JieBa Chinese Words Segment Library based on HMM model for Python"
arch=('any')
url=('https://github.com/fxsjy/jieba')
license=("MIT")
depends=('python' 'python-setuptools')
source=("http://pypi.python.org/packages/source/j/$_pkgname/$_pkgname-$pkgver.zip")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}

md5sums=('e09c3b5c9dfbb285be11802257e642c2')
