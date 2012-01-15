# Maintainer: iv597 <iv5970@gmail.com>
pkgname=python2-pyflac-git
pkgver=20111225
pkgrel=1
pkgdesc="Python FLAC API (Git)"
arch=('any')
url="https://github.com/dsully/pyflac"
license=('unknown')
depends=('python2' 'flac')
makedepends=('git' 'swig')
provides=('python2-pyflac')
conflicts=('python2-pyflac')
replaces=()
options=()

_gitroot="https://github.com/dsully/pyflac.git"
_gitname="pyflac"

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

  make && python2 ./setup.py install --root="$pkgdir"/ || return 1
}

