# Maintainer: Dany Martineau <dany.luc.martineau at gmail.com}

pkgname=kde-wacomtablet-git
pkgver=20110517
pkgrel=1
url="https://projects.kde.org/projects/extragear/base/wacomtablet"
pkgdesc="This module implements a GUI for the Wacom Linux Drivers and extends it with profile support to handle different button / pen layouts per profile."
license=('GPL2')
arch=('x86_64' 'i686')
depends=('kdelibs')
provides=('kde-wacomtablet')
makedepends=('cmake' 'automoc4' 'git' 'docbook-xml')
conflicts=('kcm_tablet' 'kcm_tablet-svn' 'kde-wacomtablet-svn')

_gitroot="git://anongit.kde.org/wacomtablet"
_gitname=wacomtablet

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname
    git config remote.origin.url $_gitroot
    git pull origin
    msg "The local files are updated."
    cd ../
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf build
  mkdir build
  cd build

  cmake ../$_gitname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON

  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
