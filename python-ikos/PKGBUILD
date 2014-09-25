# Maintainer: Maxime Arthaud <maxime at arthaud.me>

pkgname=python-ikos
pkgver=1.0
pkgrel=1
pkgdesc='Python 3 API for IKOS (Inference Kernel for Open Static Analyzers)'
arch=('any')
url='https://bitbucket.org/lememta/ikos-api'
makedepends=('git')
depends=('python' 'boost' 'boost-libs' 'gmp')
license=('MIT')
source=('git+https://bitbucket.org/lememta/ikos-api.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/ikos-api"
  python setup.py build
}

package() {
  cd "$srcdir/ikos-api"
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
