# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=telepathy-call-ui-git
pkgver=20110506
pkgrel=1
pkgdesc="Voice/Video Call UI for KDE4 Telepathy"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdebase-runtime' 'telepathy-qt4' 'qtgstreamer-git')
makedepends=('cmake' 'automoc4' 'git' 'boost')

_gitroot="git://anongit.kde.org/telepathy-call-ui.git"
_gitname="telepathy-call-ui"

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
  
  rm -rf ${srcdir}/build && mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR=${pkgdir} install
}

