pkgname=libvisual-plugins-git
pkgver=20130726
pkgrel=1
pkgdesc="Plugins for libvisual"
url="http://libvisual.org/"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('cmake')
depends=('libvisual-git' 'sdl' 'libgl' 'glu' 'gtk2' 'alsa-lib' 'libX11')
optdepends=('jack: jack support'
	    'mplayer: mplayer support'
	    'pulseaudio: pulseaudio support'
	    'luajit: LCDControl support')
provides=('libvisual-plugins')
conflicts=('libvisual-plugins')

source=()
md5sum=()

_gitroot="git://github.com/Libvisual/libvisual"
_gitname="libvisual"

build() {
  cd "$srcdir"
   
  msg "Connecting to github.com GIT server..."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting cmake..."

  cd "$srcdir"
  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build

  cd "$srcdir/$_gitname-build/libvisual-plugins"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

package() {
  cd "$srcdir/$_gitname-build/libvisual-plugins"
  make DESTDIR="$pkgdir" install
}

