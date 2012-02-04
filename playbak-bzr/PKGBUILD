# Contributor: Danilo <d4gnu.dev at gmail dot com>

pkgname=playbak-bzr
pkgver=16
pkgrel=1
pkgdesc="PlaybaK is a complete KDE Multimedia Player"
arch=('any')
url="https://launchpad.net/playbak"
license=('GPL' 'LGPL')
depends=('kdelibs' 'taglib')
makedepends=('automoc4' 'bzr' 'cmake')
provides=('playbak')
source=()
md5sums=()

_bzrbranch=http://bazaar.launchpad.net/~playbak/playbak/master
_bzrmod=master

build() {
  cd ${srcdir}/

  msg "Connecting to the server..."
  
  bzr branch ${_bzrbranch}

  msg "BZR checkout done"

  msg "Starting make..."
  
  cd ${_bzrmod}
   
  cmake . -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make  || return 1

  msg "Installing..."

  make  DESTDIR=${pkgdir} install || return 1

  msg "Cleaning..."
  rm -rf ${_bzrmod}

  msg "Done"
}
