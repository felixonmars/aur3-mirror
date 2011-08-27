# Maintainer: Michal Gawronski <dinth1906@gmail.com>

pkgname=battery-status-bzr
pkgbranch=0.1
pkgver=14
pkgrel=1
pkgdesc="Battery Status is an applet for the GNOME panel and indicator for the Indicator Applets, which provides usability way for getting power information about battery."
arch=('i686' 'x86_64')
url="https://launchpad.net/battery-status"
license=('GPL')
depends=('libindicate' 'libdbusmenu' 'ido' 'gnome-power-manager')
makedepends=('bzr')
provides=('battery-status')
conflicts=('battery-status')
source=()
md5sums=()

_bzrbranch=lp:battery-status
_bzrmod=battery-status

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

  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$pkgdir || return 1
}
