# Maintainer: Federico Chiacchiaretta <federico.chia at gmail.com>

pkgname=liblikeback-git
pkgver=20110105
pkgrel=1
pkgdesc="A tool to collect user feedback"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/libs/liblikeback/repository"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4' 'git')

_gitroot="git://anongit.kde.org/liblikeback"
_gitname="liblikeback-git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" ${srcdir}/$_gitname
  make
}

package() {
  cd $srcdir/build

  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
