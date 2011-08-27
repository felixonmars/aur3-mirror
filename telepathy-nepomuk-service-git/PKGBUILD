# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=telepathy-nepomuk-service-git
pkgver=20110726
pkgrel=1
pkgdesc="Nepomuk integration service for Telepathy"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdelibs' 'telepathy-qt4')
makedepends=('cmake' 'automoc4' 'git')

_gitroot="git://anongit.kde.org/telepathy-nepomuk-service.git"
_gitname="telepathy-nepomuk-service"

build() {
  cd ${srcdir}

  msg "Connecting to the GIT server...."
  
  if [[ -d ${srcdir}/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  
  rm -rf ${srcdir}/build
  mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake ../$_gitname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
