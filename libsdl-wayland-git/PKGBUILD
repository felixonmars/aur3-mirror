# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=libsdl-wayland-git
pkgver=20120907
pkgrel=2
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard."
arch=(any)
url="https://github.com/dhewg/libsdl"
license=('custom:zlib')
makedepends=('git' 'make')
provides=('sdl=1.2.15')

_gitroot="git://github.com/dhewg/libsdl.git"
_gitname="libsdl"

build() {
  cd ${srcdir}
  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname}
    git pull
  else
    git clone -b wl ${_gitroot}
  fi
  cd ${srcdir}/${_gitname}
  ./autogen.sh
  mkdir build && cd build
  ../configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}/build
  make DESTDIR=$pkgdir install
  install -Dm644 ../COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
