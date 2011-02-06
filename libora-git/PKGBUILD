# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=libora-git
pkgver=20100926
pkgrel=1
pkgdesc="Reference library for OpenRaster"
arch=(i686 x86_64)
url="http://create.freedesktop.org/wiki/OpenRaster"
license=('BSD')
depends=('zlib' 'libpng' 'expat')
makedepends=('git' 'cmake')
provides=('libora')
conflicts=('libora')

_gitroot="git://gitorious.org/openraster/libora.git"
_gitname="libora"

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

  # BUILD
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
  make DESTDIR="$pkgdir/" install
}
