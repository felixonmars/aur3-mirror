# Contributor: Borislav Gerassimov <borislav_ba@hotmail.com>
pkgname=openobex-git
pkgver=20081125
pkgrel=0.1
pkgdesc="Implementation of the Object Exchange (OBEX) protocol; OBEX is a session protocol and can best be described as a binary HTTP protocol. "
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://openobex.triq.net/"
#depends=('bluez>=4.1')
makedepends=('gcc' 'cmake' 'make')
conflicts=('openobex')
provides=('openobex')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://git.kernel.org/pub/scm/bluetooth/openobex.git"
_gitname="openobex"
build() {
  cd ${srcdir}
  msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
  	cd ${_gitname} && git-pull origin
  	msg "The local files are updated."
  else
  	git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r ${_gitname} ${_gitname}-build
  cd ${_gitname}-build
  mkdir build
  cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE ..

  make VERBOSE=1 || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  
  rm -rf ${srcdir}/${_gitname}-build
}