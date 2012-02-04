# Maintainer: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=telepathy-chat-handler-git
pkgver=20110802
pkgrel=1
pkgdesc="KDE Telepathy text chat handler"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdelibs' 'telepathy-qt4' 'shared-desktop-ontologies')
makedepends=('cmake' 'automoc4' 'git')
conflicts=('telepathy-kde-text-ui')

_gitroot="git://anongit.kde.org/telepathy-chat-handler.git"
_gitname="telepathy-chat-handler"

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

