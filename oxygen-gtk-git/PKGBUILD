#Maintainer: Jekyll Wu < adaptee [at] gmail [dot] com>
#Contributor: Zephyr

pkgname=oxygen-gtk-git
pkgver=20111110
pkgrel=1
pkgdesc="Port of the Oxygen theme to gtk"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/artwork/oxygen-gtk"
license=('LGPL')
depends=('gtk2' 'dbus-glib')
makedepends=('git' 'cmake')
conflicts=('oxygen-gtk')
provides=('oxygen-gtk')

_gitroot="git://anongit.kde.org/oxygen-gtk"
_gitname="oxygen-gtk"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone -l "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ../${_gitname}
  make
  make DESTDIR=${pkgdir} install
  rm -rf "${srcdir}/${_gitname}-build"
}
