# Maintainer: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: laloch <laloch@atlas.cz>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=telepathy-kde-presence-dataengine-git
pkgver=20111125
pkgrel=1
pkgdesc="Plasma dataengine for managing Telepathy account presence"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/network/telepathy/telepathy-presence-dataengine"
license=('LGPL')
depends=('telepathy-kde-common-internals-git')
makedepends=('cmake' 'automoc4' 'git')
conflicts=('telepathy-kde-presence-dataengine'
           'telepathy-presence-dataengine-git')
provides=('telepathy-presence-dataengine-git')

_gitroot="git://anongit.kde.org/telepathy-presence-dataengine.git"
_gitname="telepathy-presence-dataengine"

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

