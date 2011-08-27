# Maintainer: Michal Gawronski <dinth1906@gmail.com>
# Maintainer: Paul Burton <paulburton89@gmail.com>

pkgname=indicator-me-bzr
pkgbranch=0.2
pkgver=95
pkgrel=1
pkgdesc="A menu in the menu bar that represents you, the user, and the things that represent you in the computer. (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-me"
license=('GPL')
depends=('libindicate' 'libdbusmenu' 'ido')
makedepends=('libindicator' 'bzr')
provides=('indicator-me')
conflicts=('indicator-me')
source=()
md5sums=()

_bzrbranch=lp:indicator-me
_bzrmod=indicator-me

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
