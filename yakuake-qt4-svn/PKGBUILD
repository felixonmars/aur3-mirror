# Author: M0Rf30
pkgname=yakuake-qt4-svn
pkgver=20110422
pkgrel=1
pkgdesc="A KDE4 konsole application with the look and feel of that in the Quake engine"
arch=(i686 x86_64)
url="http://yakuake.uv.ro/"
license="GPL"

depends=('kdelibs' 'kdebase-konsole' 'automoc4')
makedepends=('subversion' 'cmake')
conflicts=('yakuake' 'yakuake-git')
provides=yakuake

_gitroot="git://anongit.kde.org/yakuake"
_gitname="yakuake"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}
  mkdir build
  cd build
  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
