# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Maintainer: Andreas Baumann <abaumann at yahoo dot com>
pkgname=wolfclient
pkgver=0.0.5
pkgrel=1
pkgdesc="Client for Wolframe."
license=('GPL3')
arch=('i686' 'x86_64' 'armv6h')
url="http://wolframe.net/"
depends=('qt4')
makedepends=('mesa-libgl' 'gdb')
source=("http://sourceforge.net/projects/wolframe/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('154d9d624f30990054492abd996b471a')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # regenarete Makefiles here, as files have to exist in order for
  # the install rules to be generated
  qmake-qt4 -config release -recursive PREFIX=/usr LIBDIR=/usr/lib/wolframe

  msg "Installing.."
  make install INSTALL_ROOT=${pkgdir}
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  msg "Generating makefiles.."
  qmake-qt4 -config release -recursive PREFIX=/usr LIBDIR=/usr/lib/wolframe
  
  msg "Building..."
  make
}
