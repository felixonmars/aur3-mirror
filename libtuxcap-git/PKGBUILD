#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=libtuxcap-git
pkgver=20101203
pkgrel=1
pkgdesc="The TuxCap games framework is a GNU/Linux port of the PopCap games framework, which is used for professional 2D game development."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tuxcap/"
license=('custom')
depends=('imagemagick' 'sdl' 'sdl_mixer')
makedepends=('cmake')
provides=('libtuxcap')
conflicts=('libtuxcap')
replaces=('libtuxcap-cvs')

_gitroot="git://tuxcap.git.sourceforge.net/gitroot/tuxcap/tuxcap "
_gitname="tuxcap"

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
  cd "$srcdir/$_gitname-build/build"

  #
  # BUILD HERE
  #

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  
  make DESTDIR="$pkgdir/" install
} 
