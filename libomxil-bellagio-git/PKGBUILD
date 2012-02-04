# Maintainer: Joni Lapilainen <joni.lapilainen@gmail.com>
pkgname=libomxil-bellagio-git
pkgver=20120109
pkgrel=1
pkgdesc="An opensource implementation of the OpenMAX Integration Layer API"
arch=('arm' 'armv7h' 'i686' 'x86_64')
url="http://omxil.sourceforge.net"
license="LGPL"
makedepends=('doxygen')
md5sums=()
provides=('libomxil-bellagio' 'libomxil-bellagio-git')

_gitroot="git://omxil.git.sourceforge.net/gitroot/omxil/omxil"
_gitname="omxil"

build() {

 msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

cd $startdir/src/$_gitname

  autoreconf -i -f || return 1
  mv configure configure.orig || return 1
  sed 's/ -Werror//g' configure.orig > configure || return 1
  chmod +x configure || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

}

