# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: RetroX <classixretrox@gmail.com>

_pkgbasename=sfml
pkgname=lib32-${_pkgbasename}-git
pkgver=20110604
pkgrel=1
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API (32-bit))'
arch=('x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=("$_pkgbasename" 'lib32-libsndfile' 'lib32-libxrandr' 'lib32-libjpeg' 'lib32-openal' 'lib32-glew' 'lib32-freetype2')
makedepends=('gcc-multilib' 'git' 'lib32-mesa' 'cmake')
options=('!libtool')

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

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_SUFFIX=32 \
    -DLIB_INSTALL_DIR=/usr/lib32
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install

  # those are already included in the sfml package
  rm -rf "$pkgdir/usr/share" "$pkgdir/usr/include"

  make clean
}