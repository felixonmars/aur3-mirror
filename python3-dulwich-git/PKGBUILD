# Contributor: Chris Eberle <eberle1080@gmail.com>

pkgname="python3-dulwich-git"
pkgver=20111127
pkgrel=1
pkgdesc="Pure-Python implementation of the Git file formats and protocols"
url="https://github.com/eberle1080/dulwich-py3k"
depends=('python')
makedepends=('git' 'python-distribute')
provides=('python3-dulwich')
conflicts=('python-dulwich')

arch=('any')
license=('GPL2')

_gitroot="git://github.com/eberle1080/dulwich-py3k.git"
_gitname="dulwich"
_snapshot="d9ca7ad2979d7edf361a601ebc4a2c7d94d9059b"

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
  git branch mystable $_snapshot
  git checkout -f mystable

  #
  # BUILD HERE
  #

  python setup.py install --optimize=1 --root=${pkgdir} || return 1
}
