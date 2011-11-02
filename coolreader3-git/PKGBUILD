# Contributor: vbPadre <vbpadre@gmail.com>

pkgname=coolreader3-git
pkgver=20111102
pkgrel=1
pkgdesc="E-book reader for Linux"
arch=('i686' 'x86_64')
url="http://coolreader.org/"
license=('gpl')
depends=('zlib' 'libpng' 'libjpeg' 'freetype2' 'qt>=4')
makedepends=('cmake')
source=()
_gitroot="git://crengine.git.sourceforge.net/gitroot/crengine/crengine"
_gitname="crengine"

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
  msg "Version - $pkgver"
  msg "Directory - $srcdir/$_gitname/qtbuild"
  msg "Starting make..."

  if [ -d "$srcdir/$_gitname/qtbuild" ] ; then
    rm -rf "$srcdir/$_gitname/qtbuild"
  fi

mkdir $srcdir/$_gitname/qtbuild
cd $srcdir/$_gitname/qtbuild
cmake -D GUI=QT -D CMAKE_BUILD_TYPE=Release  -D CMAKE_INSTALL_PREFIX=/usr ..
make
make install DESTDIR=$pkgdir 

}

