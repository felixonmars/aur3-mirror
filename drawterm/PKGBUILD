# Contributor: Andrej Nandaromovszij <sorosj@gmail.com>

pkgname=drawterm
pkgrel=2
pkgver=99
pkgdesc="Terminal emulation program for connecting to plan9 cpu servers"
arch=('i686' 'x86_64')
url="http://swtch.com/drawterm"
license=('Custom')
groups=()
source=()
md5sums=()
depends=('xorg-server')
makedepends=('make' 'gcc' 'mercurial')

_hgroot="http://code.swtch.com"
_hgrepo="drawterm"

build() {
  cd $startdir/src/$_hgrepo

  CONF=unix make || return 1
  mkdir -p $startdir/pkg/usr/bin || return 1
  cp drawterm $startdir/pkg/usr/bin || return 1
  CONF=unix make clean
}

# use acme!
