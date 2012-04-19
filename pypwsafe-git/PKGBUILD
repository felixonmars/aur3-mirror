pkgname=pypwsafe-git
pkgver=20120419
pkgrel=1
pkgdesc="A pure-Python library that can read and write Password Safe v3 files"
arch=('any')
url="http://github.com/ronys/pypwsafe"
license=('GPL')
depends=('python-mcrypt')
makedepends=('git' )


_gitroot="http://github.com/ronys/pypwsafe.git"
_gitname="pypwsafe"

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

  python2 ./setup.py install --root=$pkgdir || return 1
}
