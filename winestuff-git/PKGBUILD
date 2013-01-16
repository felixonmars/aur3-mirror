# Maintainer: Federico Cinelli <cinelli.federico@gmail.com>

pkgname="winestuff-git"
pkgver="20100807"
pkgrel=2
pkgdesc="Library for manipulating WINE prefixes. Part of WineGame."
arch=('any')
url="http://code.google.com/p/winegame/"
license=('LGPL2.1')
depends=('qt' 'fuseiso' 'wine' 'winetricks')
makedepends=('make' 'cmake' 'git')
conflicts=('winestuff' 'winegame')

_gitroot="git://github.com/pashazz/winestuff.git"
_gitname="winestuff"

build() {  
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "$srcdir/$_gitname"

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  mkdir -p build 
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make &&  make DESTDIR=${pkgdir} install
}


