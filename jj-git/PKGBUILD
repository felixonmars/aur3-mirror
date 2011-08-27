# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=jj-git
pkgver=20110308
pkgrel=1
pkgdesc="Simple FIFO and filesystem based Jabber/XMPP client inspired by ii"
arch=('i686' 'x86_64')
url="http://23.fi/jj/"
license=('GPLv3')
depends=('loudmouth')
makedepends=('git')

_gitroot="git://github.com/Petteri/jj.git"
_gitname="jj"

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

  make
  install -Dm755 jj $pkgdir/usr/bin/$_gitname
} 
md5sums=()
