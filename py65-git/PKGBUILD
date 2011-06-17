# Maintainer: mar77i <mysatyre at gmail dot com>
pkgname=py65-git
pkgver=20110617
pkgrel=1
pkgdesc="Simulate 6502-based microcomputer systems in Python."
arch=(any)
url="https://github.com/mar77i/py65"
license=('GPL')
groups=()
depends=(python)
makedepends=('git')

_gitroot=https://github.com/mar77i/py65.git
_gitname=py65

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="${pkgdir}" --optimize=1
}
