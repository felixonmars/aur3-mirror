# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-enstaller
pkgver=4.6.3
pkgrel=1
pkgdesc="Install and managing tool for egg-based packages"
arch=('any')
url="https://github.com/enthought/enstaller"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
conflicts=('python2-enstaller-git' 'python-ets-enstaller-svn')
options=(!emptydirs)

source=("https://github.com/enthought/enstaller/archive/$pkgver.tar.gz")
md5sums=('4971dd580d32d991b18be33db71773c1')

build() {
  cd "$srcdir/enstaller-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/enstaller-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

