# Maintainer: M Rawash <mrawash@gmail.com>

pkgname=libextl-darcs
pkgver=20090819
pkgrel=1
pkgdesc="Lua interfacing library for Ion3"
url="http://www.modeemi.fi/tuomov/ion/"
arch=('i686' 'x86_64')
license=('LGPL2')
depends=('lua>=5.1')
makedepends=('libtu-darcs')

_darcstrunk=http://iki.fi/tuomov/repos
_darcsmod=libextl-3

build() {
  cd "$srcdir"

  msg "Checking for previous build"

  if [ -d $srcdir/$_darcsmod/_darcs ] ; then
    msg "Retrieving missing patches"
    cd $_darcsmod
    darcs pull -a $_darcstrunk/$_darcsmod
  else
    msg "Retrieving complete sources"
    darcs get --lazy $_darcstrunk/$_darcsmod
  fi

  msg "Starting build..."

  rm -rf "$srcdir/$_darcsmod-build"
  cp -r "$srcdir/$_darcsmod" "$srcdir/$_darcsmod-build"

  cd "$srcdir/$_darcsmod-build"
  sed -i 's/usr\/local/usr/g' system.mk

  MAKEFLAGS="" make  LUA="/usr/bin/lua" || return 1
  make PREFIX="$pkgdir/usr" ETCDIR="$pkgdir/etc/ion3" install || return 1

}
