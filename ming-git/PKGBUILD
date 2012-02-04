# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: mar77i <mysatyre at gmail dot com>
pkgname=ming-git
_pkgname=libming
pkgver=20111102
pkgrel=1
pkgdesc="SWF output library"
arch=('i686' 'x86_64')
url="http://www.libming.net/"
license=('GPL' 'LGPL')
depends=('freetype2' 'libpng' 'flex')
makedepends=('git' 'bison' 'pkgconfig' 'python2')
options=('!libtool' '!emptydirs')

_gitroot="https://github.com/$_pkgname/$_pkgname.git"
_gitname="$_pkgname"

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

  ./autogen.sh
  LDFLAGS="${LDFLAGS/ -Wl,--as-needed/}"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --disable-debug --enable-python
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
