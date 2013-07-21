# Maintainer: Aris Synodinos <arissynod-gmail-com>
pkgname=urdfdom-hg
pkgver=1
pkgrel=1
pkgdesc="The URDF (U-Robot Description Format) library provides core data structures and a simple XML parsers for populating the class data structures from an URDF file"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
depends=( 'boost' 'tinyxml')
provides=('urdfdom')
conflicts=('urdfdom')
makedepends=('mercurial' 'cmake')
md5sums=() #generate with 'makepkg -g'

_hgroot=http://bitbucket.org/osrf
_hgrepo=urdfdom

build() {
  cd "${srcdir}"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot/$_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #
  mkdir "$srcdir/$_hgrepo-build"/build
  cd "$srcdir/$_hgrepo-build"/build
  cmake ..
}

package() {
  cd "$srcdir/$_hgrepo-build/build"
  make DESTDIR="$pkgdir/" install
}