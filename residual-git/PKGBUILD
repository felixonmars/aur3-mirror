# Maintainer: Christopher Daley <crdaley (at) gmail.com
 
pkgname=residual-git
pkgver=20110429
pkgrel=1
pkgdesc="A cross-platform 3D game interpreter which allows you to play LucasArts' LUA-based 3D adventures"
arch=('i686' 'x86_64')
url="http://residual.sourceforge.net"
license=('none')
depends=('sdl')
makedepends=('git')

_gitroot="https://github.com/residual/residual.git"
_gitname="residual"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
  else
    git clone --depth 1 ${_gitroot}
  fi

#  # Get/update jreen if enabled
#  # FIXME: make an external package for jreen (it's default by now)
#  cd ${srcdir}/${_gitname}/thirdparty
#  if [[ $(find -type d -empty|grep jreen|wc -l) -eq 1 ]]; then
#    msg "Obtaining jreen..."
#    cd ${srcdir}/${_gitname}
#    git submodule init && git submodule update
#  else
#    msg "Updating jreen..."
#    git pull origin
#  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf ${srcdir}/${_gitname}-build
  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR=${pkgdir} install
}
