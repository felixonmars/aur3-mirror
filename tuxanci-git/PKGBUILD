# Contributor: SergHeart
pkgname=tuxanci-git
pkgver=20110826
pkgrel=2
pkgdesc="Network/local game with penguins fighting in an arena."
url="http://www.tuxanci.org/"
arch=(i686 x86_64)
license="GPL"
makedepends=('cmake>=2.6.0' 'git')
depends=('sdl>=1.2.10' 'sdl_image>=1.2.6' 'sdl_ttf>=2.0.7' 'sdl_mixer>=1.2.7' 'zziplib' 'gettext')

_gitroot="git://repo.or.cz/tuxanci.git"
_gitname="tuxanci-0.21.0"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$_gitname"
  mkdir build
  cmake . -DCMAKE_INSTALL_PREFIX="/usr/" -DENABLE_DEBUG=1
  make
  make DESTDIR="$pkgdir" install 
}

#category: games