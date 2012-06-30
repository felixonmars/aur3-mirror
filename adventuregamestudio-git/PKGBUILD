# Maintainer: Joe Davison <joedavison.davison@gmail.com>
pkgname=adventuregamestudio-git
pkgver=20120630
pkgrel=1
pkgdesc="Native port of the Adventure Game Studio engine to Linux (git version)"
arch=('i686' 'x86_64')
url="http://www.adventuregamestudio.co.uk/"
license=('Custom')
depends=('libogg' 'libvorbis' 'libtheora' 'dumb' 'freetype2' 'allegro4')
makedepends=('git')
install=ags-git.install
source=('ags-git.install')
md5sums=('fc9706e4e3636d7e789be40480a5fdc0')
provides=('adventuregamestudio')
conflicts=('sadventuregamestudio')

_gitroot="https://github.com/adventuregamestudio/ags.git"
_gitname="ags"

if [ "$CARCH" = "x86_64" ]; then
	_gitbranch="64bit"

elif [ "$CARCH" = "i686" ]; then
	_gitbranch="main"
fi

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --branch $_gitbranch $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make --directory=Engine --file=Makefile.linux || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p $pkgdir/usr/bin
  install -D -m 755 Engine/ags $pkgdir/usr/bin
} 
