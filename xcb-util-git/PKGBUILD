# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Gigamo <gigamo@gmail.com>
# Maintainer: David Hájek <dante4d@gmail.com>
pkgname=xcb-util-git
pkgver=20111207
pkgrel=1
pkgdesc="Core XCB utility functions, GIT version"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xcb/util/"
license=('GPL')
depends=('xorg-util-macros>=1.6.0' 'libxcb' 'xcb-proto')
makedepends=('gperf' 'autoconf' 'pkgconfig' 'automake' 'git')
provides=('xcb-util')
conflicts=('xcb-util')

_gitroot="git://anongit.freedesktop.org/git/xcb/util/"
_gitname="util"

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
