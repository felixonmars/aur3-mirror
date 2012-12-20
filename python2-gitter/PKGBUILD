pkgname=python2-gitter
pkgver=0.2.5
pkgrel=1
pkgdesc="Improved command line interface for git"
arch=(any)
url="http://pypi.python.org/pypi/gitter"
license=('GPL')
groups=()
depends=('python2' 'python2-termenu' 'git')
makedepends=('python2')
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/g/gitter/gitter-${pkgver}.tar.gz)
md5sums=('eb33bdc69f65c9970204b214a04d0522')

package() {
  cd "$srcdir/gitter-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
