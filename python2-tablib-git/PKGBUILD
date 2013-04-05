# Maintainer: Wieland Hoffmann <the_mineo@web.de>
pkgname=python2-tablib-git
pkgver=v0.9.11_74_gcd71e1a
pkgrel=1
arch=('any')
pkgdesc="Python Module for Tabular Datasets in XLS, CSV, JSON, YAML, HTML & TSV"
url="http://python-tablib.org"
license=('MIT')
depends=('python2')
makedepends=('git')
source=('git+https://github.com/kennethreitz/tablib.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/tablib"
  echo "$(git describe --tags --always | sed 's/-/_/g')"
}

package() {
  cd "$srcdir/tablib"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
