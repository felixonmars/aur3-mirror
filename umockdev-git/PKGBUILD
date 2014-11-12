# Plase submit changes to the git repository
# https://github.com/masterkorp/pkgbuilds

# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
pkgname=umockdev-git
_gitname=umockdev
pkgver=394.a733e8c
pkgrel=1
pkgdesc="Mock hardware devices for creating unit tests and bug reporting https://launchpad.net/umockdev"
arch=("i686" "x86_64")
url="https://github.com/martinpitt/umockdev"
license=('GPL')
groups=()
depends=("vala")
makedepends=('git')
source=("$_gitname::git+https://github.com/martinpitt/umockdev.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$_gitname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
