# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Based on package by: Leonid Selivanov <bravebug at gmail dot com>

pkgname=ubuntuone-storage-protocol-bzr
pkgver=74
pkgrel=1
pkgdesc="Python library for Ubuntu One file storage and sharing service, bleeding-edge version"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntuone-storage-protocol"
license=('GPL3')
groups=('ubuntuone-bzr')
depends=('python' 'protobuf' 'protobuf-python' 'pyxdg' 'python-pycurl')
makedepends=('bzr')
provides=('ubuntuone-storage-protocol')
conflicts=('ubuntuone-storage-protocol')
options=(!emptydirs)

_bzrbranch=lp:ubuntuone-storage-protocol
_bzrseries=trunk

build() {

  cd ${srcdir}
  msg "Connecting to the server...."
  if [ ! -d ./${_bzrseries} ]; then
    bzr co ${_bzrbranch} ${_bzrseries}
  else
    cd ${_bzrseries}
    bzr up ${_bzrseries}
  fi
  cd ${srcdir}

  msg "BZR checkout done or server timeout"
  [ -d ${_bzrseries}-build ] && rm -rf ${_bzrseries}-build
  msg "Creating build copy"
  bzr co ${_bzrseries} ${_bzrseries}-build
  cd ${_bzrseries}-build

  # Start install
  python setup.py install --root=$pkgdir/
}
