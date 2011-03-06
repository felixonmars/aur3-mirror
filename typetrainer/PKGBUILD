#Maintainer: Anton Bobrov <bobrov@vl.ru>

pkgname=typetrainer
pkgver=0.5.2
pkgrel=1
pkgdesc="A typing tutor trainer written on python"
arch=(any)
url="https://github.com/baverman/typetrainer"
license=('MIT')
groups=()
depends=('pygtk' 'python2')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/t/typetrainer/$pkgname-$pkgver.tar.gz)
md5sums=('d4c0cc1848aff4f648b44856516f4592')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
