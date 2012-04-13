# Maintainer: Thomas Riccardi <kiwiiii at gmail dot com>

pkgname=libtvdb-git
pkgver=20120414
pkgrel=1
pkgdesc="A small library to fetch TV series information from the thetvdb.com web service"
arch=('any')
url="http://libtvdb.sourceforge.net/"
license=('GPLv2.1')
depends=('kdebase-runtime>=4.5.80')
makedepends=('git' 'cmake')
conflicts=('libtvdb')
replaces=('libtvdb')

_gitroot="git://libtvdb.git.sourceforge.net/gitroot/libtvdb/libtvdb"
_gitname="libtvdb"

source=()
md5sums=()

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot} && cd ${_gitname}
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release ./
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
