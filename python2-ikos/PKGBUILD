# Maintainer: Maxime Arthaud <maxime at arthaud.me>

pkgname=python2-ikos
pkgver=1.0
pkgrel=1
pkgdesc='Python 2 API for IKOS (Inference Kernel for Open Static Analyzers)'
arch=('any')
url='https://bitbucket.org/lememta/ikos-api'
makedepends=('git')
depends=('python2' 'boost' 'boost-libs' 'gmp')
license=('MIT')
source=('git+https://bitbucket.org/lememta/ikos-api.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/ikos-api"
  python2 setup.py build
}

package() {
  cd "$srcdir/ikos-api"
  python2 setup.py install --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
