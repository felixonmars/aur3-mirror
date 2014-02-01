# epfl-menu
#
# Maintainer: Antoine Albertelli <antoine.albertelli@epfl.ch>
pkgname=epfl-menu
pkgver=r10.9b4a45c
pkgrel=2
pkgdesc="A pretty printer for the lunch menu at the École Polytechnique Fédérale de Lausanne"
arch=(any)
url="https://github.com/gcmalloc/epfl-menu"
license=('GPL')
groups=()
depends=('python2-beautifulsoup3')
makedepends=('git' 'python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('git+https://github.com/gcmalloc/epfl-menu.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
