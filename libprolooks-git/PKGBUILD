# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: hm_b < holger at music-nerds dot net>
pkgname=libprolooks-git
pkgver=20090427
pkgrel=1
pkgdesc="a custom widget library for Gtk+ designed for audio applications"
url="http://www.hansfbaier.de/wordpress/libprolooks/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'vala==0.6.1-1')
makedepends=()
conflicts=('libprolooks')
replaces=()
install=

backup=()
source=()
md5sums=()

_gitroot="git://repo.or.cz/libprolooks.git"
_gitname="libprolooks"

build() {

  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "Local repository updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  
  msg "GIT checkout done or server timeout"

  msg "Removing old build directory..."
  rm -Irf ${srcdir}/$_gitname-build

  msg "Creating new build directory..."
  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build

  msg "Starting make..."
  cd ${srcdir}/$_gitname-build
  ./waf configure --prefix=/usr || return 1
  ./waf build || return 1
  ./waf install --destdir=$startdir/pkg || return 1
}
