# Maintainer: Andreas Wagner <AndreasBWagner@pointfree.net>
pkgname=python-canoepaddle-git
pkgver=r215.dcf91a2
pkgrel=2
pkgdesc="Stroke based graphics, outputting to SVG"
arch=('any')
url="https://github.com/christian-oudard/canoepaddle"
license=('unknown')
groups=()
depends=('python-grapefruit-git' 'python-vec')
makedepends=()
provides=('python-canoepaddle')
conflicts=('python-canoepaddle')
replaces=()
backup=()
options=(!emptydirs)
install=
source=("git+https://github.com/christian-oudard/canoepaddle.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/canoepaddle"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/canoepaddle"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
