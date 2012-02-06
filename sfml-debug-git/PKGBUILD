pkgname=sfml-debug-git
pkgver=20111010
pkgrel=1
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API. (debug libs)'
arch=('i686' 'x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('sfml' 'libsndfile' 'libxrandr' 'libjpeg' 'openal' 'glew' 'freetype2')
makedepends=('git' 'mesa' 'cmake' 'doxygen')
provides=('sfml-debug')
options=('!strip')

_gitroot='https://github.com/LaurentGomila/SFML.git'
_gitname='SFML'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. \
        -DCMAKE_BUILD_TYPE=Debug
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir/usr/share" "$pkgdir/usr/include" "$pkgdir/usr/lib/pkgconfig"

  make clean
}