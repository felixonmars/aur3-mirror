# Maintainer: Nezmer <Nezmer@gmail.com>
pkgname=schroedinger-git
pkgver=20091227
pkgrel=2
pkgdesc="An implemenation of the Dirac video codec in ANSI C code (Git snapshots)"
arch=('i686' 'x86_64')
url="http://www.diracvideo.org/"
license=('GPL2' 'LGPL2' 'MPL' 'MIT')
depends=('gstreamer0.10-base' 'orc-git')
makedepends=('git')
provides=('schroedinger')
conflicts=('schroedinger')
options=(!libtool)
source=()
md5sums=()

_gitroot="git://diracvideo.org/git/schroedinger.git"
_gitname="schroedinger"

build() {

  cd "$srcdir"
  msg "Connecting to the schroedinger git repository..."

  if [ -d "$srcdir/$_gitname" ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/"

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install

  install -m644 -D COPYING.MIT $pkgdir/usr/share/licenses/$pkgname/COPYING.MIT
}

