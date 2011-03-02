# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=jsoundz
pkgname=$_pkg-git
pkgver=20110302
pkgrel=1
pkgdesc="A jack / qt4 SoundWall / CartWall."
arch=('i686' 'x86_64')
url="https://github.com/zotz/jSoundz/wiki"
license=('GPL')
depends=('qt')
optdepends=('sox: sox backend'
            'jack: jack backend'
            'mplayer: mplayer backend')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")

_gitroot="git://github.com/zotz/jSoundz.git"
_gitname="$_pkg"

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

  # fixes ambiguos calls to QString()
  sed -i "s|NULL||" src/{main,swall}.cpp

  qmake -project
  qmake
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  install -Dm755 $_pkg-build "$pkgdir/usr/bin/$_pkg"
} 
