# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

##############################################################

pkgname=liblastfm-git
pkgver=20121103
pkgrel=1
pkgdesc="A collection of libraries to help you integrate Last.fm services into your rich desktop software"
arch=('i686' 'x86_64')
url="https://github.com/lastfm/liblastfm/"
license=('GPL')
depends=('qt' 'libsamplerate' 'fftw')
makedepends=('git' 'cmake')
provides=('liblastfm')
conflicts=('liblastfm')

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
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}/build
  make DESTDIR=${pkgdir} install
}
