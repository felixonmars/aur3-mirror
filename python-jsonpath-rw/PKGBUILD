pkgname=python-jsonpath-rw
_srcname=python-jsonpath-rw
pkgver=1.2.0
pkgrel=1
pkgdesc='A robust and significantly extended implementation of JSONPath for Python, with a clear AST for metaprogramming.'
url='https://github.com/kennknowles/python-jsonpath-rw'
arch=('any')
license=('Apache 2.0')
depends=('python' 'python-six' 'python-ply')
source=("https://github.com/kennknowles/${_srcname}/archive/${pkgver}.tar.gz")
md5sums=('9e762f82349b4261b72b0636c1cd6836')

package() {
  cd $_srcname-$pkgver
  python setup.py install --root="$pkgdir"
}
