# Maintainer: Tobias Roettger <toroettg@gmail.com>

pkgname=python-appdirs
pkgver=1.4.0
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir".'
arch=(any)
url="https://github.com/ActiveState/appdirs"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/a/appdirs/appdirs-$pkgver.tar.gz")
md5sums=('1d17b4c9694ab84794e228f28dc3275b')

package() {
  cd "$srcdir/appdirs-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
