# Maintainer: Ethan Zonca <ethanzonca@gmail.com>

pkgname=rtklib-git
pkgver=20131209
pkgrel=2
pkgdesc="An open-source program for GNSS positioning"
url="http://rtklib.com/"
license=("BSD")
arch=('i686' 'x86_64' 'armv7h')
makedepends=('git')

_gitroot="https://github.com/tomojitakasu/RTKLIB.git"
_gitname="RTKLIB"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/${_gitname}/app

  make -C pos2kml/gcc
  make -C str2str/gcc
  make -C rnx2rtkp/gcc
  make -C convbin/gcc
  make -C rtkrcv/gcc

}

package() {
  mkdir -p $pkgdir/usr/local/bin
 
  cd ${srcdir}/${_gitname}

  mkdir -p $pkgdir/usr/share/rtklib
  cp -R data $pkgdir/usr/share/rtklib/data

  cd app

  make -C pos2kml/gcc BINDIR=$pkgdir/usr/local/bin install 
  make -C str2str/gcc BINDIR=$pkgdir/usr/local/bin install 
  make -C rnx2rtkp/gcc BINDIR=$pkgdir/usr/local/bin install 
  make -C convbin/gcc BINDIR=$pkgdir/usr/local/bin install 
  make -C rtkrcv/gcc BINDIR=$pkgdir/usr/local/bin install 

}

