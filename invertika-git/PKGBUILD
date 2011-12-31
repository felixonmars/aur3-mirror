pkgname=invertika-git
pkgver=20111226
pkgrel=1
pkgdesc="A german MMORPG based on the Manasource plattform"
arch=('i686' 'x86_64')
url="http://invertika.org/"
license=('GPL2')
makedepends=('git' 'cmake')
depends=('guichan' 'curl' 'physfs' 'libpng' 'libpthread-stubs' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf' 'sdl_gfx' 'libxml2' 'zlib' 'libtool' 'gettext')
provides=('invertika')
conflicts=('mana')

_gitroot=git://github.com/Invertika/invertika.git
_gitname=invertika

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD
  #
  cd semistable/client 
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/usr"
  make
  make DESTDIR="$pkgdir/" install
}
