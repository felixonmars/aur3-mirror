# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=lv2-mdaepiano-git
pkgver=20120522
pkgrel=1
pkgdesc="Native LV2 port of the famous mda e-piano VSTi plugin"
arch=('i686' 'x86_64')
url="http://github.com/rekado/lv2-mdaEPiano"
license=('GPL2')
depends=('lv2')
makedepends=('git' 'lv2-c++-tools')
provides=('lv2-mdaepiano')
conflicts=('lv2-mdaepiano')

_gitroot="http://github.com/rekado/lv2-mdaEPiano.git"
_gitname="lv2-mdaepiano"

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
  cd "$srcdir/$_gitname-build/src"

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build/src"

  make INSTALL_DIR="$pkgdir/usr/lib/lv2" install
} 
