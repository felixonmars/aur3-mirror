# Contributor: Marcus Werner <myself@prakti.org>
# Maintainer: Henning Bekel <h dot bekel at googlemail dot com>

pkgname=gimp-resynth
pkgver=20120508
pkgrel=1
epoch=1
pkgdesc="Resynthesizer plugin for The Gimp"
arch=('i686' 'x86_64')
url="https://github.com/bootchk/resynthesizer"
license=('GPL2')
depends=('gimp')
makedepends=('git' 'intltool')

_gitroot="https://github.com/bootchk/resynthesizer.git"
_gitname="resynthesizer"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  sed -i 's/automake-1.11/automake-1.12/g' autogen.sh
  sed -i 's/aclocal-1.11/aclocal-1.12/g' autogen.sh
  sed -i '27 a AC_CHECK_LIB(gthread-2.0, g_thread_init)' configure.in

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
