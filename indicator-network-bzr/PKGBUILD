# Maintainer: Michal Gawronski <dinth1906@gmail.com>

pkgname=indicator-network-bzr
pkgbranch=0.2
pkgver=34
pkgrel=1
pkgdesc="Network Menu for controlling network connections. Uses Connection Manager. (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-network"
license=('GPL')
depends=('libindicate' 'libdbusmenu' 'ido' 'connman')
makedepends=('libindicator' 'bzr')
provides=('indicator-network')
conflicts=('indicator-network')
source=()
md5sums=()

_bzrbranch=lp:indicator-network
_bzrmod=indicator-network

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
