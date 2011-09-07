# Original uploader: Michal Gawronski <dinth1906@gmail.com>
# Maintainer: wodim <neikokz@gmail.com>

pkgname=empathy-theme-ubuntu-adium-bzr
pkgver=12
pkgrel=1
pkgdesc="Adium message style for Ubuntu"
arch=('any')
url="https://launchpad.net/adium-theme-ubuntu"
license=('GPL')
depends=('empathy')
makedepends=('bzr' 'python-distutils-extra')
provides=('empathy-theme-ubuntu-adium')
conflicts=('empathy-theme-ubuntu-adium')
source=()
md5sums=()

_bzrbranch=lp:adium-theme-ubuntu
_bzrmod=adium-theme-ubuntu

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

  python2 ./setup.py build
  python2 ./setup.py install --prefix=/usr --root=$pkgdir
}
