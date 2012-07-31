# Maintainer: Oliver Chang <oliverc.aur@gmail.com>

pkgname=dispad-git
pkgver=20120731
pkgrel=1
pkgdesc="A daemon for temporarily disabling trackpads on keyboard events. Works with xf86-input-mtrack by default."
arch=('i686' 'x86_64')
url="http://github.com/BlueDragonX/dispad"
license=('GPL2')
depends=('confuse' 'libxi')
makedepends=('git')
optdepends=('xf86-input-mtrack: a multitouch X driver')
provides=('dispad')
conflicts=('dispad')

_gitroot="https://github.com/BlueDragonX/dispad.git"
_gitname="dispad"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build

  cd ${srcdir}/${_gitname}-build

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}-build

  make DESTDIR=${pkgdir} install
}
