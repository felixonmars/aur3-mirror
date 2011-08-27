# Maintainer: Michal Gawronski <dinth1906@gmail.com>

pkgname=ubuntu-mono-bzr
pkgver=66
pkgrel=1
pkgdesc="Icons for the panel, designed in a simplified monochrome style."
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu-mono"
license=('GPL')
depends=('humanity-icon-theme')
makedepends=('bzr')
provides=('ubuntu-mono')
conflicts=('ubuntu-mono')
source=()
md5sums=()

_bzrbranch=lp:ubuntu-mono
_bzrmod=ubuntu-mono

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

  mkdir -p $pkgdir/usr/share/icons/

  cp -r "LoginIcons" "$pkgdir/usr/share/icons"
  cp -r "ubuntu-mono-dark" "$pkgdir/usr/share/icons"
  cp -r "ubuntu-mono-light" "$pkgdir/usr/share/icons"

}
