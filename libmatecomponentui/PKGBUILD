# Maintainer: Perberos <perberos@gmail.com>
pkgname=libmatecomponentui
pkgver=20130101
pkgrel=1
pkgdesc="User Interface library for MateComponent"
url="https://github.com/mate-desktop/libmatecomponentui"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('libmatecanvas' 'libmate')
makedepends=('git' 'intltool' 'pkgconfig')
groups=('mate')
options=('!emptydirs' '!libtool')
source=()
sha256sums=()

_gitroot=git://github.com/mate-desktop/libmatecomponentui.git
_gitname=libmatecomponentui

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
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/applications/matecomponent-browser.desktop"
}
