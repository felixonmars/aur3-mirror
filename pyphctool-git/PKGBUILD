
# Maintainer: Jashandeep Sohi <jashandeep.s.sohi@gmail.com>
pkgname=pyphctool-git
pkgver=20121219
pkgrel=1
pkgdesc="A Python tool for finding and setting PHC VIDs."
arch=('any')
url="https://github.com/jashandeep-sohi/pyphctool"
license=('GPL3')
depends=('python')
makedepends=('git')
backup=('etc/phc/vids.conf')

_gitroot="https://github.com/jashandeep-sohi/pyphctool.git"
_gitname="pyphctool"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

