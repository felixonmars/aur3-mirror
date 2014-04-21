# Maintainer: Andreas Wagner <AndreasBWagner@pointfree.net>
pkgname=python-ithkuil-git
pkgver=r163.9e522e6
pkgrel=1
pkgdesc="Tools for the grammar and writing system of the Ithkuil constructed language"
arch=('any')
url="https://github.com/christian-oudard/ithkuil"
license=('unknown')
groups=()
depends=('python-canoepaddle-git' 'python-pyquery' 'python-vec' 'inkscape' 'pngcrush')
makedepends=()
provides=('python-ithkuil')
conflicts=('python-ithkuil')
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$pkgname::git+https://github.com/christian-oudard/ithkuil.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  # TODO install other stuff too. Maybe in opt or share.
}

# vim:set ts=2 sw=2 et:
