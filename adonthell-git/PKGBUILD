# Contributor: Iwan Gabovitch (qubodup) <qubodup@gmail.com>

pkgname=adonthell-git
pkgver=20100408
pkgrel=1
pkgdesc="A 2D graphical, single player role playing game engine"
arch=('i686' 'x86_64')
url="http://adonthell.linuxgames.com/"
license=('GPL')
depends=('sdl_mixer>=1.2' 'sdl_ttf>=2' 'python>=2')

_gitroot="git://github.com/ksterker/adonthell.git"
_gitname="adonthell"

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

