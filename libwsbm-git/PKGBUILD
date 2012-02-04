# Maintainer: Mika 'ighea' Hynnä <igheax AT gmail D com>
pkgname=libwsbm-git
pkgver=20111104
pkgrel=1
pkgdesc="The libwsbm library previously lived as a dri buffer manager within mesa."
arch=('i686' 'x86_64')
url="http://www.x.org/wiki/libwsbm"
license=('GPL')
depends=('libdrm')
makedepends=('git')
provides=('libwsbm')
replaces=('libwsbm')
conflicts=('libwsbm')

_gitroot=git://git.freedesktop.org/git/mesa/libwsbm
_gitname=libwsbm

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
