# Maintainer: Tavian Barnes <tavianator@gmail.com>

pkgname="dimension-git"
pkgver=20110616
pkgrel=1
pkgdesc="A photo-realistic 3-D renderer"
arch=('i686' 'x86_64')
url="http://www.tavianator.com/dimension/"
license=('GPL3' 'LGPL3')
depends=('libpng' 'libgl' 'python')
makedepends=('cython' 'pkgconfig')
provides=('dimension')
conflicts=('dimension')
replaces=()
options=('!libtool')

_gitroot="git://gitorious.org/dimension/dimension.git"
_gitname="dimension"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
