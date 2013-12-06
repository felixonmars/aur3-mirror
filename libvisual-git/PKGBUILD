pkgname=libvisual-git
pkgver=20130823
pkgrel=1
pkgdesc="Abstraction library that comes between applications and audio visualisation plugins"
url="http://libvisual.org/"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('cmake')
depends=('sdl' 'libgl' 'libX11')
provides=('libvisual' 'lv-tool')
conflicts=('libvisual')

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

  cd "$srcdir/$_gitname-build/libvisual"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

package() {
  cd "$srcdir/$_gitname-build/libvisual"
  make DESTDIR="$pkgdir" install
}

