# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Sven Schneider <mr_xyz_unknown@web.de>
# Contributor: Dustin Mays <dork.fish.wat@gmail.com>
# Contributor: scj <scj archlinux us>

pkgname=mingw32-sfml-git
pkgver=20120225
pkgrel=1
pkgdesc="A simple, fast, cross-platform, and object-oriented multimedia API (mingw32)"
arch=('i686' 'x86_64')
url="http://sfml-dev.org"
license=('zlib')
depends=('mingw32-libsndfile' 'libxrandr' 'mingw32-libjpeg' 'mingw32-libpng' 'mingw32-openal' 'mingw32-glew' 'mingw32-freetype')
makedepends=('mesa' 'cmake' 'git')
provides=('mingw32-sfml')
source=(cmake-toolchain.cmake)
options=(!strip !buildflags)
md5sums=('dd2b2db48187dff84050fe191d309d81')

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
  
  unset LDFLAGS
  
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32/ \
    -DCMAKE_TOOLCHAIN_FILE=${srcdir}/cmake-toolchain.cmake
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  
  make DESTDIR=${pkgdir} install

  install -Dm 644 ../license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm $pkgdir/usr/i486-mingw32/bin/libsndfile-1.dll
  rm $pkgdir/usr/i486-mingw32/bin/openal32.dll
  rm $pkgdir/usr/i486-mingw32/license.txt
}

# vim:ts=2:sw=2
