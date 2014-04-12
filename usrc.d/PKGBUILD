# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="usrc.d"
pkgver=latest
pkgrel=1
pkgdesc="A set of script for managing a user session (and user-session daemons)."
url="git+ssh://git@github.com/hobarrera/usrc.d.git"
arch=('any')
url="https://github.com/hobarrera/usrc.d"
license=('BSD')
source=("git+ssh://git@github.com/hobarrera/usrc.d.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo 1.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
}
