# Contributor: Iwan Gabovitch (qubodup) <qubodup@gmail.com>

pkgname=adonthell-tools-git
pkgver=20100408
pkgrel=1
pkgdesc="Game development tools (dialog, map, object & quest editors) for the 2D RPG engine Adonthell"
arch=('i686' 'x86_64')
url="http://adonthell.linuxgames.com/"
license=('GPL')
depends=('sdl_mixer>=1.2' 'sdl_ttf>=2' 'python>=2')

_gitroot="git://github.com/ksterker/adonthell-tools.git"
_gitname="adonthell-tools"

build() {
  cd $srcdir

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "$srcdir/$_gitname"

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}

