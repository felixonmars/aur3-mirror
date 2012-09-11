# Maintainer: Yuri Bugelli <yuri.bugelli@gmail.com>

pkgname=nautilus-image-manipulator-bzr
pkgver=192
pkgrel=1
pkgdesc="Resize and send images from Nautilus3"
arch=('i686' 'x86_64')
url="https://launchpad.net/nautilus-image-manipulator"
license=('GPL-3')
depends=('python2' 'nautilus>=3.0.0' 'python-nautilus' 'pyexiv2' 'python-imaging')
makedepends=('python2' 'python2-distutils-extra>=2.32' 'bzr')
install=$pkgname.install

_bzrtrunk=lp:nautilus-image-manipulator
_bzrmod=nautilus-image-manipulator

build() {
  cd "${srcdir}"
  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ${_bzrmod}-build ] && rm -rf ${_bzrmod}-build
  cp -r ${_bzrmod} ${_bzrmod}-build
  cd ${_bzrmod}-build

  python2 setup.py build
}

package() {
  cd "${srcdir}"/${_bzrmod}-build
  python2 ./setup.py install --root="${pkgdir}"
}
