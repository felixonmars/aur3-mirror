# Maintainer: Josh Klar <iv5970@gmail.com>
pkgname=python-primitivelogger-git
pkgver=20120307
pkgrel=1
pkgdesc="A barebones-simple file and/or stdout/stderr logger"
arch=('any')
url="https://github.com/iv597/primitivelogger"
license=('custom')
depends=('python' 'python-clint')
makedepends=('git')
provides=('python-primitivelogger')
conflicts=('python-primitivelogger')
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

  python ./setup.py install --root="$pkgdir"/ || return 1
}

