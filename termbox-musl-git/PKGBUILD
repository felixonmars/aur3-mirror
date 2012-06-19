 
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=termbox-musl-git
pkgver=20120618
pkgrel=1
pkgdesc="termbox library (ncurses alternative), built on/for musl libc"
arch=('i686' 'x86_64')
url="http://code.google.com/p/termbox/"
license=('custom')
depends=('musl')
makedepends=('git' 'cmake')
provides=('musl-curses')
sources=('curses.h' 'term.h')
md5sums=('5ba320795ae1eab57508c4076c6b76f7' '50d4ebec7a2b6825881428b81a20500b')

_gitroot='git://github.com/nsf/termbox.git'
_gitname='termbox'

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

  CC="musl-gcc -static -D_GNU_SOURCE" cmake . 
  CC="musl-gcc -static -D_GNU_SOURCE" make 
  cd $srcdir/termbox-build/src/
  install -D -m664 termbox.h "$pkgdir/usr/musl/include/termbox.h"
  install -D -m644 term.h "$pkgdir/usr/musl/include/termbox_term.h"
  install -D -m644 ringbuffer.h "$pkgdir/usr/musl/include/ringbuffer.h"
  install -D -m644 $startdir/curses.h "$pkgdir/usr/musl/include/curses.h"
    install -D -m644 $startdir/term.h "$pkgdir/usr/musl/include/term.h"  
  install -D -m664 libtermbox.a "$pkgdir/usr/musl/lib/libtermbox.a"
  cd $pkgdir/usr/musl/lib/
  ln -s libtermbox.a libcurses.a
} 