# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=ogre-procedural-git
pkgver=20110725
pkgrel=1
pkgdesc="Procedural geometry for Ogre3D"
arch=(i686 x86_64)
url="http://code.google.com/p/ogre-procedural/"
license=('MIT')
depends=('ogre')
makedepends=('git')
provides=('ogre-procedural')
conflicts=('ogre-procedural')
source=()
md5sums=()

_gitroot="git://github.com/ducttape/ogre-procedural.git"
_gitname="ogre-procedural"

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

  #
  # BUILD HERE
  #

  [[ -d build ]] && rm -r build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  cd build
  make DESTDIR="$pkgdir/" install
} 
