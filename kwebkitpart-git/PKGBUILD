# $Id$
# Submitter: chromatic6 <solojay6@gmail.com>
# Maintainer: greenmanalishi <capoiosct@gmail.com>

pkgname=kwebkitpart-git
pkgver=20120104
pkgrel=1
pkgdesc="A WebKit browser component for KDE"
url="http://opendesktop.org/content/show.php?content=127960"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
provides=('kwebkitpart')
conflicts=('kwebkitpart')
replaces=('kwebkitpart')

_gitroot="git://anongit.kde.org/kwebkitpart"
_gitname="kwebkitpart"


build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  git clone ${srcdir}/${_gitname} ${srcdir}/build
  cd ${srcdir}/build

  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
