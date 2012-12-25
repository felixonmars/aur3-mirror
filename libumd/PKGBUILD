# Maintainer: Alf <naihe2010@126.com>

pkgname=libumd
pkgver=20121225
pkgrel=1
pkgdesc='A UMD parser and render C library'
arch=('i686' 'x86_64')
url='http://naihe2010.github.com/libumd/index.html'
license=('GPLv2')
depends=()
makedepends=('git' 'cmake' 'doxygen')
options=('!buildflags')
_gitroot='http://github.com/naihe2010/libumd.git'
_gitname='libumd'
md5sums=()

build() {
  cd "$srcdir"

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
    cd $_gitname
  fi

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DLIBUMD_WITH_INSTALL=ON ..
  make -j1
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install

  make clean
}
