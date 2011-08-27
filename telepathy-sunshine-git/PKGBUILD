# Maintainer: Robert Chmielowiec <robert@chmielowiec.net>
pkgname=telepathy-sunshine-git
pkgver=20110506
pkgrel=1
pkgdesc="Telepathy-sunshine is the Gadu-Gadu connection manager for Telepathy. (Git version)"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/telepathy/telepathy-sunshine/"
groups=('telepathy')
license=('GPL3')
depends=('twisted' 'python-telepathy' 'python2')
optdepends=('python2-pyopenssl: SSL support')
provides=('telepathy-sunshine')
makedepends=('git')

_gitroot=git://anongit.freedesktop.org/telepathy/telepathy-sunshine
_gitname=telepathy-sunshine

build() {
  cd ${srcdir}
  msg "Connecting to git server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
      cd ${_gitname} && git pull origin
      msg "The local files are updated."
  else
      git clone ${_gitroot}
      cd ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  
  msg "Patching for python2"
  sed -i 's_#!/usr/bin/python$_#!/usr/bin/python2_' $srcdir/$_gitname/$_gitname
  
  msg "Compiling..."
  export PYTHON="/usr/bin/python2"
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/telepathy
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
