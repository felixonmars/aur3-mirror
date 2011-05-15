# Maintainer: Michal Gawronski <dinth1906@gmail.com>
# Maintainer: Paul Burton <paulburton89@gmail.com>
# Contributor: max.bra <max.bra at alice dot it>

pkgname=indicator-messages-bzr
pkgbranch=0.4
pkgver=212
pkgrel=1
pkgdesc="A place on the user's desktop that collects messages that need a response. (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-messages"
license=('GPL')
depends=('libindicate-bzr' 'libdbusmenu-bzr')
makedepends=('libindicator-bzr' 'bzr')
provides=('indicator-messages')
conflicts=('indicator-messages')
source=()
md5sums=()

_bzrbranch=lp:indicator-messages
_bzrmod=indicator-messages

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
