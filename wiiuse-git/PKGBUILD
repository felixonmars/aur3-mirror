# Maintainer: Alucryd <alucryd at gmail dot com>

pkgname=wiiuse-git
pkgver=20121210
pkgrel=1
pkgdesc="WiiUse Wii Remote access library"
arch=('i686' 'x86_64')
url="https://github.com/rpavlik/wiiuse"
license=('GPL3')
depends=('bluez' 'sdl' 'glu' 'freeglut')
makedepends=('git')
provides=('wiiuse')
conflicts=('wiiuse')

_gitroot="https://github.com/rpavlik/wiiuse.git"
_gitname="wiiuse"

build () {
  cd "${srcdir}"
  msg "Connecting to the GIT server..."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd "${_gitname}"
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot} ${_gitname}
    cd "${_gitname}"
  fi
  msg "GIT checkout done."
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install
}
