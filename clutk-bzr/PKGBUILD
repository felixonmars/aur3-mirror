# Maintainer: Michal Gawronski <dinth1906@gmail.com>

pkgname=clutk-bzr
pkgbranch=0.3
pkgver=224
pkgrel=1
pkgdesc="A general-purpose toolkit for Clutter used by UNR's netbook-launcher."
arch=('i686' 'x86_64')
url="https://launchpad.net/clutk"
license=('GPL')
depends=('libindicate' 'libdbusmenu' 'ido' 'clutter')
makedepends=('bzr')
provides=('clutk=0.3.36')
conflicts=('clutk')
source=()
md5sums=()

_bzrbranch=lp:clutk
_bzrmod=clutk

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
