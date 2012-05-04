# Maintainer demonicmaniac <namida1@gmx.net>
pkgname=curses-benchmark-git
pkgver=20120504
pkgrel=1
pkgdesc="curses benchmark tool"
arch=('i686' 'x86_64')
url="https://github.com/jonbirge/curses-benchmark"
license=('gpl')
depends=('ncurses')
makedepends=('git')

_gitroot="https://github.com/jonbirge/curses-benchmark.git"
_gitname="curses-benchmark"

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  sed -i 's|CFLAGS =.*|CFLAGS+= -std=c99 -lm -lncurses|' Makefile
  make
}

package(){
    install -d ${pkgdir}/usr/bin
    install -D -m755 "$srcdir/$_gitname-build/cursbench" "$pkgdir/usr/bin/cursbench"
}

