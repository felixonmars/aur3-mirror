# Maintainer: Kelytha <kelytharun _AT_ gmail>
# Contributor: ianux <ianux@free.fr>
pkgname=puae-qt-git
pkgver=20120619
pkgrel=1
pkgdesc="Qt build of the PUAE Amiga emulator"
arch=('i686' 'x86_64')
url="http://github.com/GnoStiC/PUAE"
license=('GPL')
depends=('alsa-lib' 'qt' 'libgl' 'sdl' 'zlib' 'glib2' 'freetype2' 'libpng')
makedepends=('git')
conflict=('e-uae' 'uae')
source=()
md5sums=()

_gitroot="http://github.com/GnoStiC/PUAE.git"
_gitname="PUAE"

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

  ./bootstrap.sh
  ./configure --prefix=/usr \
    --with-sdl \
    --with-sdl-gfx \
    --with-sdl-gl \
    --with-alsa \
    --enable-bsdsock \
    --enable-drvsnd \
    --with-qt
  make
  make DESTDIR="$pkgdir" install
}
