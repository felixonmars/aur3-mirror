# Maintainer: Perberos <perberos@gmail.com>
pkgname=libmatecanvas
pkgver=20130101
pkgrel=1
pkgdesc="The MATE Canvas library"
url="https://github.com/mate-desktop/libmatecanvas"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libglade' 'libart-lgpl' 'libmate')
makedepends=('git' 'pkgconfig' 'intltool')
options=('!libtool')
groups=('mate')
source=()
sha256sums=()

_gitroot=git://github.com/mate-desktop/libmatecanvas.git
_gitname=libmatecanvas

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
    --prefix=/usr --disable-static \
    --enable-glade || return 1
  #--with-gtk=3.0
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" install
}
