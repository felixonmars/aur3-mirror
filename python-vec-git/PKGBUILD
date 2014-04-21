# Maintainer: Andreas Wagner <AndreasBWagner@pointfree.net>
pkgname=python-vec-git
pkgver=r20.d9ff3e7
pkgrel=1
pkgdesc="Lightweight vector library for Python"
arch=('any')
url="https://github.com/christian-oudard/vec"
license=('unknown')
groups=()
depends=()
makedepends=()
provides=('python-vec')
conflicts=('python-vec')
replaces=()
backup=()
options=(!emptydirs)
install=
source=("git+https://github.com/christian-oudard/vec.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/vec"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/vec"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
