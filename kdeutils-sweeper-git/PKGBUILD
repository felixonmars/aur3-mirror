# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeutils-sweeper-git
pkgver=20120906
pkgrel=1
pkgdesc='System Cleaner'
url='http://kde.org/applications/utilities/sweeper'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'git')
conflicts=('kdeutils-sweeper')
provides=('kdeutils-sweeper')

_gitroot="git://anongit.kde.org/sweeper.git"
_gitname="sweeper"

build() {
  msg "Connecting to GIT server...."

  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}"/build
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build
  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
