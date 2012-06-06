# Contributor: Zazzman <azazeleblis@gmail.com>

pkgname=conkydeluge-git
pkgver=20120606
pkgrel=1
pkgdesc="Provides Deluge info, for use in Conky (for Deluge v 1.2.0 onwards)"
arch=('i686' 'x86_64')
url="https://github.com/cas--/conkyDeluge"
license=('GPL3')
depends=('python')

makedepends=('git' 'bash')
conflicts=()
source=()

_gitroot="git://github.com/cas--/conkyDeluge.git"
_gitname="conkyDeluge"

build () {
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

  python setup.py build || return 1
  python setup.py install --root=$pkgdir || return 1
  install -D -m644 README $pkgdir/usr/share/conkydeluge/README || return 1
}