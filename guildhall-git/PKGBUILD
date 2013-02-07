# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Cong Gu <gucong43216@gmail.com>
pkgname=guildhall-git  
pkgver=20130206
pkgrel=1 
pkgdesc="the package manager for guile 2"
url="https://github.com/ijp/guildhall"
arch=('i686' 'x86_64')
license=('GPL')
depends=('guile>=2.0')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/ijp/guildhall.git"
_gitname="guildhall"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull master
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr -C
  make || return 1
  make DESTDIR="$pkgdir/" install
}
