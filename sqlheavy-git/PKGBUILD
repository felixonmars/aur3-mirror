# Maintainer: Ner0

pkgname=sqlheavy-git
pkgver=20120423
pkgrel=1
pkgdesc="A wrapper on top of SQLite with a GObject-based interface"
arch=('i686' 'x86_64')
url="https://code.google.com/p/sqlheavy/"
license=('LGPL')
depends=('gtk2' 'sqlite3' 'freetype2' 'cairo')
makedepends=('vala')
options=('!libtool')

_gitroot=git://gitorious.org/sqlheavy/sqlheavy.git
_gitname=sqlheavy

build() {
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin && cd ..
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  [ -d "$_gitname-build" ] && rm -rf "$_gitname-build"
  git clone "$_gitname" "$_gitname-build"
  cd "$_gitname-build"

  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
  make
} 
package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
