# Maintainer: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: laloch <laloch@atlas.cz>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=telepathy-kde-presence-applet-git
pkgver=20120131
pkgrel=1
pkgdesc="Plasma applet for managing your Telepathy account presence"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/kdereview/ktp-presence-applet"
license=('GPL')
depends=('telepathy-kde-common-internals-git>=20111210')
makedepends=('cmake' 'automoc4' 'git')
conflicts=('telepathy-kde-presence-applet'
           'telepathy-presence-applet-git'
)

_gitroot="git://anongit.kde.org/ktp-presence-applet.git"
_gitname="ktp-presence-applet"

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
