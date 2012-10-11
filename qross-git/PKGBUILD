# Contributor: Artem Sereda <overmind88@gmail.com>
pkgname=qross-git
pkgver=20121011
pkgrel=1
pkgdesc="Qt-only fork of Kross, the KDE scripting framework"
arch=('i686' 'x86_64')
url="http://github.com/0xd34df00d/Qross"
license=('GPL')
depends=('qt>=4.6.0')
makedepends=('git')
provides=('qross')
conflicts=('qross')
source=()
md5sums=()

_gitroot="http://github.com/0xd34df00d/Qross.git"
_gitname="Qross"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

#  rm -r "$srcdir/$_gitname-build"
  #cp -r "$srcdir/$_gitname" "$startdir/src/$_gitname-build"
  #cd "$srcdir/$_gitname-build/src/"
  cd  $srcdir/Qross/src/qross
  mkdir -p build
  cd build

  #
  # BUILD HERE
  #

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make  || return 1
  make DESTDIR=$startdir/pkg install
}  
