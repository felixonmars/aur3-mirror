# Maintainer: Michal Gawronski <dinth1906@gmail.com>

pkgname=xchat-indicator-bzr
pkgbranch=0.3
pkgver=22
pkgrel=1
pkgdesc="Plugin to make XChat use the messaging indicator (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/xchat-indicator"
license=('GPL')
depends=('libindicate' 'libdbusmenu' 'ido' 'xchat-gnome')
makedepends=('libindicator' 'bzr')
provides=('xchat-indicator')
conflicts=('xchat-indicator')
source=()
md5sums=()

_bzrbranch=lp:xchat-indicator
_bzrmod=xchat-indicator

build() {
   cd ${srcdir}

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrbranch} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  ./autogen.sh || return 1
  ./configure --disable-static --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
