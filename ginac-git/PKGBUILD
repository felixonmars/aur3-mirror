# $Id$
# Contributor: Will Chappell <mr.chapendi@gmail.com>
pkgname=ginac-git
pkgver=20091105
pkgrel=1
pkgdesc="Symbolic manipulation for C++"
arch=(i686 x86_64)
url="http://www.ginac.de/"
license=('GPL')
conflicts=(ginac)
depends=(cln gmp)
makedepends=()
source=()
md5sums=()
_gitroot="git://www.ginac.de/ginac.git"
_gitname="ginac"

build() {
  cd "$srcdir"
  msg "Connecting to the $pkgname git repository."
  
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir"

  rm -rf "$_gitname"-build
  git clone "$_gitname" "$_gitname"-build
  cd "$_gitname"-build

  aclocal || return 1
  libtoolize || return 1
  autoheader || return 1
  automake --add-missing || return 1
  autoconf || return 1
  ./configure --prefix=/usr || return 1
  make -j1 || return 1
  make check
  make DESTDIR="$startdir/pkg" install
}

