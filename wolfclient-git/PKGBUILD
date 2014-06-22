# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Maintainer: Andreas Baumann <abaumann at yahoo dot com>
pkgname=wolfclient-git
pkgver=20140620
pkgrel=1
pkgdesc="Client for Wolframe."
license=('GPL3')
arch=('i686' 'x86_64' 'armv6h')
url="http://wolframe.net/"
depends=('qt4')
makedepends=('git' 'mesa-libgl' 'gdb')

_gitroot=git://github.com/Wolframe/wolfclient.git
_gitname=wolfclient

package() {
  cd ${srcdir}/$_gitname-build

  # regenarete Makefiles here, as files have to exist in order for
  # the install rules to be generated
  qmake-qt4 -config debug -recursive PREFIX=/usr LIBDIR=/usr/lib/wolframe

  msg "Installing.."
  make install INSTALL_ROOT=${pkgdir}
}

build() {
  cd ${srcdir}
  
  msg "Getting source from git..."
  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
  fi

  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build

  msg "Generating makefiles.."
  qmake-qt4 -config debug -recursive PREFIX=/usr LIBDIR=/usr/lib/wolframe
  
  msg "Building..."
  make
}
