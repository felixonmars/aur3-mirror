pkgname=mate-calc-git
pkgver=20130401
pkgrel=1
pkgdesc="Calculator for the Mate desktop environment"
arch=('i686' 'x86_64')
license=('LGPL' 'GPL')
depends=('gtk2' 'libxml2' 'libpng' 'freetype2' 'pixman' 'pango' 'gdk-pixbuf2' 'cairo' 'atk')
provides=('mate-calc')
conflicts=('mate-calc')
makedepends=('pkgconfig' 'mate-doc-utils' 'git')
groups=('mate-extra')
url="https://github.com/mate-desktop/mate-calc"
source=()
sha256sums=()
install=mate-calc.install

_gitroot=git://github.com/mate-desktop/mate-calc.git
_gitname=mate-calc

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

  ./autogen.sh \
    --prefix=/usr \
    --with-gtk=2.0 || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}" install || return 1
}

