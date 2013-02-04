# Maintainer: Anntoin Wilkinson <anntoin gmail com>
pkgname=python2-shareboard-git
pkgver=20130204
pkgrel=1
pkgdesc="Shareboard is a local HTTP server which works like clipboard"
arch=('any')
url="https://github.com/lambdalisue/Shareboard"
license=('MIT')
depends=('python2')
makedepends=('git')
optdepends=('python2-pyside: for built-in viewer')
provides=('python2-shareboard')

_gitroot=https://github.com/lambdalisue/Shareboard.git
_gitname=Shareboard

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

}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
