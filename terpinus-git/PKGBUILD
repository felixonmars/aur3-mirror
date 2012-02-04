# Contributor: Trương Xuân Tính <tinh.truong@evolus.vn>
pkgname=terpinus-git
pkgver=20090711
pkgrel=1
pkgdesc="Terminus fontset with 86 additional Vietnamese glyphs"
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/terpinus.git"
license=('GPL')
depends=()
makedepends=('git' 'perl')

provides=('terpinus')
conflicts=('terpinus')
source=()
md5sums=()

_gitroot="git://repo.or.cz/terpinus.git"
_gitname="terpinus"
_gitbranch="master"

build() {
  cd $startdir/src
  msg "Connecting to GIT server...."

  if [ ! -d $_gitname ] ; then
    git clone $_gitroot
  fi

  cd $_gitname
  git pull origin $_gitbranch

  msg2 "GIT checkout done or server timeout"
  msg "Starting make..."

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
} 
