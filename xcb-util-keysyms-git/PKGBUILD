# Maintainer: David Hájek <dante4d@gmail.com>
pkgname=xcb-util-keysyms-git
pkgver=20110822
pkgrel=1
pkgdesc="Standard X constants and conversion to/from keycodes, GIT version"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xcb/util-keysyms"
license=('GPL')
depends=('libxcb' 'xcb-proto' 'xcb-util-git')
makedepends=('gperf' 'autoconf' 'pkgconfig' 'automake' 'git')
provides=('xcb-util-keysyms')
conflicts=('xcb-util-keysyms')

_gitroot="git://anongit.freedesktop.org/git/xcb/util-keysyms/"
_gitname="util-keysyms"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --recursive "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
