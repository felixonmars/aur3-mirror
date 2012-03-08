# Maintainer: Josh Klar <iv5970@gmail.com>
pkgname=python2-primitivelogger-git
pkgver=20120307
pkgrel=1
pkgdesc="A barebones-simple file and/or stdout/stderr logger"
arch=('any')
url="https://github.com/iv597/primitivelogger"
license=('custom')
depends=('python2' 'python2-clint')
makedepends=('git')
provides=('python2-primitivelogger')
conflicts=('python2-primitivelogger')
replaces=()
options=()

_gitroot="https://github.com/iv597/primitivelogger.git"
_gitname="primitivelogger"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 ./setup.py install --root="$pkgdir"/ || return 1
}

