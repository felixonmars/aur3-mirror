# Maintainer: David Hájek <dante4d@gmail.com>
pkgname=xcb-util-image-git
pkgver=20110822
pkgrel=1
pkgdesc="XCB port of Xlib's XImage and XShmImage, GIT version"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xcb/util-image"
license=('GPL')
depends=('libxcb' 'xcb-proto' 'xcb-util-git')
makedepends=('gperf' 'autoconf' 'pkgconfig' 'automake' 'git')
provides=('xcb-util-image')
conflicts=('xcb-util-image')

_gitroot_util="git://anongit.freedesktop.org/git/xcb/util/"
_gitname_util="util"
_gitroot_util_image="git://anongit.freedesktop.org/git/xcb/util-image/"
_gitname_util_image="util-image"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname_util" ]]; then
    cd "$_gitname_util" && git pull origin
    msg "The local files are updated."
  else
    git clone --recursive "$_gitroot_util" "$_gitname_util"
  fi

  if [[ -d "$_gitname_util_image" ]]; then
    cd "$_gitname_util_image" && git pull origin
    msg "The local files are updated."
  else
    git clone --recursive "$_gitroot_util_image" "$_gitname_util_image"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname_util_image-build"
  cp -R "$srcdir/$_gitname_util_image" "$srcdir/$_gitname_util_image-build"
  cd "$srcdir/$_gitname_util_image-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname_util_image-build"
  make DESTDIR="$pkgdir/" install
}

