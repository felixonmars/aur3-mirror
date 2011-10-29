#Maintainer: Anton Bobrov <bobrov@vl.ru>

pkgname=orcsome
pkgver=0.3.2
pkgrel=1
pkgdesc="A scripting extension for NETWM compliant window managers"
arch=(any)
url="https://github.com/baverman/orcsome"
license=('MIT')
groups=()
depends=('python2' 'python-xlib')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/o/orcsome/$pkgname-$pkgver.tar.gz)
md5sums=('265aff15204bdfe2660ea41a16e5a49d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
