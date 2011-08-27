# Maintainer: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=telepathy-send-file-git
pkgver=20110802
pkgrel=1
pkgdesc="A File manager plugin to launch a file transfer job with a specified contact"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdelibs' 'telepathy-qt4')
makedepends=('cmake' 'automoc4' 'git')
conflicts=('telepathy-kde-send-file')

_gitroot="git://anongit.kde.org/telepathy-send-file.git"
_gitname="telepathy-send-file"

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
