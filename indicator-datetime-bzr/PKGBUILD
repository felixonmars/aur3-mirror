# Maintainer: Michal Gawronski <dinth1906@gmail.com>

pkgname=indicator-datetime-bzr
pkgbranch=0.1
pkgver=13
pkgrel=1
pkgdesc="A very simple clock. (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-datetime"
license=('GPL')
depends=('libindicate' 'libdbusmenu' 'ido')
makedepends=('libindicator' 'bzr')
provides=('indicator-datetime')
conflicts=('indicator-datetime')
source=()
md5sums=()

_bzrbranch=lp:indicator-datetime
_bzrmod=indicator-datetime

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
