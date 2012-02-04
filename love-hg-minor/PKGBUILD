# Contributor: Andrzej Giniewicz < gginiu@gmail.com >
# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=love-hg-minor
pkgver=662
pkgrel=1
pkgdesc="LÖVE is an open-source 2D game engine which uses the versatile Lua scripting language to create dynamic gaming experiences. This is the 'minor' development branch, which has features to due for next minor LÖVE release."
arch=(i686 x86_64)
url="http://love2d.org/"
license=('zlib')
depends=('luajit2' 'physfs' 'freetype2' 'devil' 'mpg123' 'openal' 'libvorbis' 'libmodplug')
makedepends=('mercurial')
options=(!strip)

_hgroot="http://bitbucket.org/rude"
_hgrepo=love

build() {
  unset LDFLAGS
  cd "$srcdir"
  rm -rf $_hgrepo-build
  cp -rf $_hgrepo $_hgrepo-build
  cd $_hgrepo-build

	msg "Switching branch"
	hg update minor

  msg "Updating version information"
  head -c 15 configure.in > configure.in.tmp
  echo " [`hg log -l1 --template '{node|short}'`-`date +%Y%m%d`])" >> configure.in.tmp
  tail -n +2 configure.in >> configure.in.tmp
  cp configure.in.tmp configure.in
  rm configure.in.tmp

  msg "Updating compiled modules"
  cd src/scripts
  luajit2 ./auto.lua audio boot graphics    || return 1
  cd ../..

  msg "Generating makefiles"
  sh platform/unix/automagic                || return 1

  msg "Building and packaging"
  ./configure --prefix=/usr --with-luajit   || return 1
  make                                      || return 1
  make DESTDIR="$pkgdir" install            || return 1

  cd "$pkgdir"/usr/bin
  mv love love-hg-minor
}
