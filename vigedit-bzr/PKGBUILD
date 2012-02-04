# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=vigedit-bzr
pkgver=74
pkgrel=1
pkgdesc="Plugin for Gedit, which provides Vim key bindings to the Gedit editor"
arch=('i686' 'x86_64')
url="https://launchpad.net/vigedit"
license=('GPL')
depends=('gedit-plugins-extra')
makedepends=('bzr')
provides=('vigedit')
conflicts=('vigedit')

_bzrbranch="lp:~delfick/vigedit/vigedit-additions"
_bzrmod="vigedit"

build() {
   cd ${srcdir}

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrbranch} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Installing..."

  cd ./${_bzrmod}

  python install.py -b ${pkgdir}/usr/lib/gedit-2 -p ViGedit

}

