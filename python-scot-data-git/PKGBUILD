# Maintainer: SCoT Development Team

pkgname=python-scot-data-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Example data for SCoT, the EEG Source Connectivity Toolbox"
arch=('any')
url="https://github.com/SCoT-dev/scot-data"
license=('MIT')
provides=('python-scot-data')
makedepends=('git')
depends=('python' 'python-scot-git')
source=("$pkgname"::'git+https://github.com/SCoT-dev/scot-data.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%sr%s.%s" "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  # nothing to build - package is pure python
  #python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --prefix=$pkgdir/usr --optimize=1
}
