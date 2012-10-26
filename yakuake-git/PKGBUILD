# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=yakuake-git
pkgver=20121026
pkgrel=1
pkgdesc="A KDE konsole application with the look and feel of that in the Quake engine - GIT version"
arch=('i686' 'x86_64')
url="http://yakuake.kde.org"
license=('GPL')
depends=('kdebase-konsole')
makedepends=('cmake' 'automoc4' 'git')
install="${pkgname}.install"
provides=('yakuake')
conflicts=('yakuake')

_gitroot="git://anongit.kde.org/yakuake.git"
_gitname="yakuake"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}

    # Change remote url to anongit
    if [ -z $( git branch -v | grep anongit ) ] ; then
        git remote set-url origin ${_gitroot}
    fi
    
    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}
  mkdir -p build
  cd build
  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
