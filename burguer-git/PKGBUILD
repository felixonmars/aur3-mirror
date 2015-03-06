# Maintainer: Thiago Kenji Okada <thiago DOT mast3r AT gmail DOT com>

pkgname="burguer-git"
pkgver=0.1
pkgrel=2
pkgdesc="A delicious AUR helper. Made from cower."
arch=('i686' 'x86_64')
url="https://github.com/m45t3r/burguer"
license=('MIT')
depends=('cower' 'pacman' 'python')
optdepends=('mc: check package contents before operation')
source=("git+${url}")
md5sums=('SKIP')
provides=("burguer")

pkgver() {
  cd "burguer"
  git describe --always | sed 's/-/./g'
}

package() {
  cd "${srcdir}/burguer"
  python setup.py install --root="${pkgdir}/"
}

# vim: ts=8 et sw=2 sts=2
