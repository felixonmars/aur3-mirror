# Maintainer: Petr Kovar <pejuko@gmail.com>

pkgname=scantailor-cli-git
pkgver=20110218
pkgrel=1
pkgdesc="Interactive post-processing tool for scanned pages with cli interface"
arch=(i686 x86_64)
url="http://scantailor.sourceforge.net"
license=('GPL')
depends=('qt' 'libjpeg' 'zlib' 'libpng' 'libtiff' 'libxrender')
makedepends=('git' 'cmake' 'boost')
conflicts=('scantailor' 'scantailor-git')

_gitroot="git://scantailor.git.sourceforge.net/gitroot/scantailor/scantailor"
_gitname="scantailor-cli.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname/build"
  mkdir -p "$srcdir/$_gitname/build"
  cd "$srcdir/$_gitname/build"
  git checkout -b cli origin/cli
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir/" install
} 
