# Maintainer Alfredo Palhares <masterkorp@masterkorp.net>

pkgname=freescale-s12x-binutils-git
pkgver=20120824
pkgrel=1
pkgdesc="Binary utilities for the S12X and XGATE processors by Freescale"
arch=('i686' 'x86_64')
url="https://github.com/seank/FreeScale-s12x-binutils"
license=('GPL')
depends=('bc')
makedepends=('git')
install="freescale-s12x-binutils.install"

_gitroot="git://github.com/seank/FreeScale-s12x-binutils.git"
_gitname="freescale-s12x-binutils"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "$_gitname" ] ; then
    cd $_gitname && git pull && cd ..
  else
    git clone $_gitroot $_gitname
  fi

  if [ -d "$_gitname-build" ]; then
    rm -rf $_gitname-build
  fi
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  msg "Starting make..."
  CC=gcc ./configure --disable-dependency-tracking \
  --prefix=/usr/s12x/ \
  --sysconfdir=/etc

  make
}

package() {
  cd $srcdir/$_gitname-build
  make DESTDIR=${pkgdir} install

  # Making symlinks
  mkdir $pkgdir/usr/bin
  for binary in $pkgdir/usr/s12x/bin/*
  do
    ln -s $binary "$pkgdir/usr/bin/s12x-${binary##*/}"
  done
}
