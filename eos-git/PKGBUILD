# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=eos-git
pkgver=20120107
pkgrel=1
pkgdesc="A reimplementation of BioWare's Aurora engine (and derivatives)"
arch=('i686' 'x86_64')
url="https://github.com/DrMcCoy/eos"
license=('GPL')
depends=('boost-libs' 'mesa' 'sdl' 'freetype2' 'openal' 'libmad' 'libogg' 'libvorbis' 'faad2' 'xvidcore')
makedepends=('git' 'boost')

_gitroot="https://github.com/DrMcCoy/eos.git"
_gitname="eos"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}

