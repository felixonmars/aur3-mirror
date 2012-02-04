# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=vtg-git
pkgver=20111227
pkgrel=1
pkgdesc="A collection of plugins for gEdit to make it a better programmer editor for the Vala language."
arch=('i686' 'x86_64')
url="http://code.google.com/p/vtg/"
license=('GPL2' 'LGPL2.1')
depends=('gedit>=3.0.0' 'vala' 'gdk-pixbuf2' 'afrodite-git')
makedepends=('git')
install=vtg-git.install
options=(!libtool)
provides=('vtg')
conflicts=('vtg')

_gitroot=git://gitorious.org/vala-toys/vala-toys.git
_gitname=vala-toys

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" --depth 1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  # --disable-afrodite only disables the building of it, and we want to use the systemwide lib instead
  LIBS=-lm ./autogen.sh --prefix=/usr --disable-afrodite --with-systemlibs
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
