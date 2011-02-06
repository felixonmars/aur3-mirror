# Contributor: Krzysztof Malinowski <boromil@gmail.com>
pkgname=screenie-git
pkgver=20090123
pkgrel=1
pkgdesc="Fancy screenshot composer"
arch=('i686' 'x86_64')
url="http://screenie.googlecode.com"
license=('GPL')
depends=('qt>=4.4.0')
makedepends=()
provides=('screenie')
conflicts=('screenie')
source=()
md5sums=()

_gitroot="git://github.com/ariya/screenie.git"
_gitname="screenie"

build() {
  cd $startdir/src
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -r $startdir/src/$_gitname-build
  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build/

  #
  # BUILD HERE
  #

  qmake

  sed -ri "s/(^CFLAGS[[:space:]]*=) .*$/\1 $CFLAGS -Wall -W -D_REENTRANT \$\(DEFINES\)/" Makefile
  sed -ri "s/(^CXXFLAGS[[:space:]]*=) .*$/\1 $CXXFLAGS -Wall -W -D_REENTRANT \$\(DEFINES\)/" Makefile


  make || return 1

  mkdir -p $startdir/pkg/usr/bin
  cp -a $startdir/src/$_gitname-build/screenie $startdir/pkg/usr/bin/
} 
