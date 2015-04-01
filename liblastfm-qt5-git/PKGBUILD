# Maintainer: Michael Wendland <michael@michiwend.com>

pkgname=liblastfm-qt5-git
pkgver=1.1.0.4433165
pkgrel=2
pkgdesc="A collection of libraries to help you integrate Last.fm services into your rich desktop software. (builds the qt5 version)"
arch=('i686' 'x86_64')
url="https://github.com/lastfm/liblastfm/"
license=('GPL')
depends=('qt5-base' 'libsamplerate' 'fftw')
makedepends=('git' 'cmake')
provides=('liblastfm-qt5')
conflicts=('liblastfm-qt5')

_gitroot="git://github.com/lastfm/liblastfm.git"
_gitname="liblastfm"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  mkdir ${srcdir}/${_gitname}/build
  cd ${srcdir}/${_gitname}/build

  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_WITH_QT4=off
  make
}

package() {
  cd ${srcdir}/${_gitname}/build
  make DESTDIR=${pkgdir} install
}

# vim: ts=2 sw=2 et:
