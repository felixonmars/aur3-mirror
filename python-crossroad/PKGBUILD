_pkgname=crossroad
pkgname=python-$_pkgname
pkgver=0.4.4
pkgrel=1
pkgdesc="cross-compilation command-line toolkit for Linux"
arch=('any')
url="http://git.tuxfamily.org/crossroad/crossroad.git"
license=('AGPL')
depends=('python')
source=("https://pypi.python.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('5852421cbb78e6bc332e4194b7770267')
makedepends=('python-setuptools' 'python-docutils')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i "s|'man/man1/'|'share/man/man1/'|g" setup.py
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python ./setup.py install --prefix=/usr --root="$pkgdir"
}
