# Maintainer: Brieuc Roblin <brieuc.roblin at gmail dot com>
pkgname="brainfuck-parser"
pkgver=20110601
pkgrel=1
pkgdesc="Brainfuck interpretor in C"
arch=('i686' 'x86_64')
license=('GPL')
makedepend=(git)
url="http://www.pyrotools.org"

_gitroot="git://gitorious.org/brainfuck-parser/brainfuck-parser.git"
_gitname="brainfuck"

build() {
  cd "$srcdir"

  msg2 "Connecting to GIT server..."
  if [ -d $_gitname ] ; then
    ( cd $_gitname && git pull )
  else
    git clone $_gitroot $_gitname || return 1
  fi

  cd "$_gitname"

  msg2 "Starting make..."
  make
}

package() {
  cd "$srcdir/$_gitname"
  msg2 "Packing..."
  DESTDIR="$pkgdir/usr" make install
}