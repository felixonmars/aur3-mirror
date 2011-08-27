# $Id$
# Contributor: Will Chappell <mr.chapendi@gmail.com>
pkgname=ioke-git
pkgver=20100821
pkgrel=4
pkgdesc="Ioke is a dynamic prototype-based programming language targeted at the Java Virtual Machine."
arch=(i686 x86_64)
url="http://ioke.org"
license=('custom')
conflicts=(ioke)
depends=(java-runtime)
makedepends=(apache-ant git jdk ruby)
source=('ioke.sh')
md5sums=('212beaafccee04c044385d75b175b055')
_gitroot="git://github.com/olabini/ioke.git"
_gitname="ioke"

build() {
  cd "$srcdir"
  msg "Connecting to the $pkgname git repository."
  
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir"

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  ant || return 1  

  mkdir -p $startdir/pkg/opt/ioke/
  mv $startdir/src/${_gitname}-build/* $startdir/pkg/opt/ioke
  install -D -m755 $startdir/src/ioke.sh $startdir/pkg/etc/profile.d/ioke.sh

  rm $startdir/pkg/opt/ioke/bin/*.bat
  rm $startdir/pkg/opt/ioke/bin/*.dll
  rm $startdir/pkg/opt/ioke/bin/*.mdb

  rm -f $startdir/pkg/opt/ioke/*.git
  rm -f $startdir/pkg/opt/ioke/*.xml
  rm -f $startdir/pkg/opt/ioke/*.rb
  rm -f $startdir/pkg/opt/ioke/*.build
  
  rm -r $startdir/pkg/opt/ioke/bench
  rm -r $startdir/pkg/opt/ioke/src
  rm -r $startdir/pkg/opt/ioke/test

}

