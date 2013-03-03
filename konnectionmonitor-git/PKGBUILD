# Maintainer: Artem A. Klevtsov unikum.pm@gmail.com
pkgname=konnectionmonitor-git
pkgver=20130304
pkgrel=1
pkgdesc="Monitor incoming and outgoing TCP connections"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KonnectionMonitor?content=140883"
license=('GPL')
depends=('qt4')
makedepends=('git' 'cmake')

_gitroot='git://gitorious.org/konnectionmonitor/konnectionmonitor.git'
_gitname='konnectionmonitor'

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    cd ${_gitname}
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting make..."
  if [ -d "${srcdir}/${_gitname}/build" ]; then
    rm -rf "${srcdir}/${_gitname}/build"
  fi
  mkdir "${srcdir}/${_gitname}/build"
  cd "${srcdir}/${_gitname}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install
  rm -rf "${srcdir}/${_gitname}/build"
}
