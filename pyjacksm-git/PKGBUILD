# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=pyjacksm-git
pkgver=20100514
pkgrel=1
pkgdesc="A simple manager for jack-session"
arch=('any')
url="http://trac.jackaudio.org/wiki/WalkThrough/User/jack_session"
license=('GPL')
depends=('python')
makedepends=('git')
provides=('pyjacksm')

_gitroot="git://hochstrom.endofinternet.org/pyjacksm.git"
_gitname="pyjacksm"

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

  #
  # BUILD HERE
  #
   
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
} 
