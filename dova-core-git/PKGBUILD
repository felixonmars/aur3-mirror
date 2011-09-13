# Maintainer: Blaž Tomažič <blaztomazic@gmail.com>

pkgname=dova-core-git
pkgver=20110913
pkgrel=1
pkgdesc="An experimental application framework written in Vala, it consists of a type system and libraries for application development (Core library)"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Dova"
license=('LGPL')
depends=('glibc')
makedepends=('git' 'vala-devel')
provides=('dova-core')
conflicts=('dova-core')
options=(!libtool)

_gitroot=git://gitorious.org/dova/dova-core.git
_gitname=dova-core

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
