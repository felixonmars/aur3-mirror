# Maintainer: Michal Gawronski <dinth1906@gmail.com>

pkgname=indicator-evolution-bzr
pkgbranch=0.3
pkgver=64
pkgrel=1
pkgdesc="A plugin for Evolution that uses libindicate and libnotify to provide additional information to the shell about Evolution's state. (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/evolution-indicator"
license=('GPL')
depends=('libindicate' 'libdbusmenu' 'ido' 'evolution')
makedepends=('libindicator' 'bzr')
provides=('indicator-evolution')
conflicts=('indicator-evolution')
source=()
md5sums=()

_bzrbranch=lp:evolution-indicator
_bzrmod=evolution-indicator

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
