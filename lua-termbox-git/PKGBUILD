# Maintainer: robem <robem@posteo.de>
pkgname=lua-termbox-git
pkgver=1
pkgrel=1
pkgdesc="A Termbox API wrapper for Lua."
license=('')
arch="any"
url="https://github.com/robem/lua-termbox"
depends=('lua>=5.2' 'termbox-git')
makedepends=('git' 'scons')

_gitroot="git://github.com/robem/lua-termbox.git"
_gitname="lua-termbox"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  cd ${srcdir}

  msg "GIT checkout done or server timeout"
  msg "Starting build ..."

  cd ${_gitname}
  scons
}

package() {
  cd ${srcdir}/${_gitname}
  scons PREFIX="${pkgdir}" install
} 

