# Contributor: gucong <gucong43216@gmail.com>
pkgname=ibus-table-taiji-git
pkgver=20100801
pkgrel=1
pkgdesc="The Taiji (Chinese) Input Method for IBus Table"
arch=('i686' 'x86_64')
url="http://tjm.taiji1.com/tjminput/index.htm"
license=('GPL')
depends=('ibus-table')
makedepends=('git')
source=()
md5sums=()

_gitroot="http://github.com/microcai/ibus-table-taiji.git"
_gitname="ibus-table-taiji"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull master
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr --libexecdir=/usr/lib/ibus \
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
