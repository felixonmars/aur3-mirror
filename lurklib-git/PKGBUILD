# Contributor: LK- <lk07805@gmail.com>
# Maintainer: LK- <lk07805@gmail.com>
pkgname=lurklib-git
pkgver=20110614
pkgrel=1
pkgdesc="Lurklib is a threading-safe, event-driven IRC library designed for creating anything from bots to full-fledged IRC clients."
arch=(any)
url="https://github.com/LK-/lurklib/"
license=('GPL')
depends=('python')
optdepends=('python2: for Python 2 support')
_gitroot="git://github.com/LK-/lurklib.git"
_gitname="master"

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
  python setup.py install --root=$pkgdir/
  if [[ -e /usr/bin/python2 ]]; then
    python2 setup.py install --root=$pkgdir/
  fi
}
