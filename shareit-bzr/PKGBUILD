# The ArchLinux and Parabola GNU/Linux PKGBUILD

pkgname=shareit-bzr
pkgrel=1
pkgver=2010.03.06
pkgdesc="ShareIt! is a free, easy to configurate, easy to use web server."
url="https://launchpad.net/shareit-server"
license=('GPL3')
arch=('i686' 'x86_64')
makedepends=('bzr')
depends=('python' 'pyqt' 'dbus')
build() {
  cd ${srcdir}

  if [ -d "$srcdir/shareit-server" ] ; then
    cd shareit-server && bzr up
  else
    bzr checkout https://code.edge.launchpad.net/~shareit-server/shareit-server/devel shareit-server
  fi
  
  cd ${srcdir}/shareit-server
  echo ${srcdir}
  make install PREFIX=${srcdir}
}
