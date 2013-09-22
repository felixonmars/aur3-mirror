# Maintainer : Clément Zotti <clement.zotti@sfr.fr>
# Use PKGBUILD from python-blist in AUR maintained by
# Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Chris Baker <baker.chris.3@gmail.com>

pkgname=python-blist-git
pkgver=1.3.4
pkgrel=3
pkgdesc="A list-like type with better asymptotic performance (Python 3 version)"
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/blist/"
license=('BSD')
depends=('python')
makedepends=('python-distribute')
source=(git://github.com/DanielStutzbach/blist.git)
md5sums=('SKIP')

build() {
  cd "$srcdir/blist"
  python setup.py build
}

package() {
  cd "$srcdir/blist"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

