# Maintainer: Daniel Krueger <keenbug at gmail.com>
pkgname=guile-cairo-git
pkgver=20120406
pkgrel=1
pkgdesc="Guile Scheme bindings for the cairo graphics library"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/guile-cairo/"
license=('LGPL3')
depends=('guile>=1.8.0' 'cairo>=1.2.0')
makedepends=('git')
provides=('guile-cairo')
conflicts=('guile-cairo')
install=guile-cairo.install
options=(!libtool)

_gitroot=git://git.sv.gnu.org/guile-cairo.git
_gitname=guile-cairo

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
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
