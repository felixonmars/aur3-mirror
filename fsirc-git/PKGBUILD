# Contributor: adriano <adriano.src@gmail.com>

pkgname=fsirc-git
pkgver=20081002
pkgrel=1
pkgdesc="Simple IRC client in Qt4/C++."
arch=('i686' 'x86_64')
url="http://nblast.org/wiki/fsirc"
license=('GPL2')
depends=('qt')
makedepends=('cmake' 'git')
provides=('fsirc')
conflicts=('fsirc')
source=()  
md5sums=()

_gitroot="git://voker57.nonlogic.org/fsirc.git"
_gitname="fsirc"

build() {
 cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d "$srcdir/$_gitname-build" ] ; then
  rm -rf "$srcdir/$_gitname-build"
  fi
  
  cp -r "$srcdir/$_gitname" "$startdir/src/$_gitname-build"
  cd "$srcdir/$_gitname-build"


  #
  # BUILD HERE
  #

  cmake . -DCMAKE_INSTALL_PREFIX=/usr  || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
