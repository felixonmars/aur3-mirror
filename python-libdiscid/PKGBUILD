# Maintainer: Sebastian Ramacher <sebastian+dev@ramacher.at>
pkgname=python-libdiscid
pkgver=0.4
pkgrel=1
pkgdesc="Python binding for libdiscid"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/python-libdiscid"
license=('MIT')
depends=('python>=3.1' 'libdiscid>=0.5')
makedepends=('cython>=0.15' 'python-setuptools')
conflicts=()
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3d0daa62f980251dfe2ca7a39c946d0e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
