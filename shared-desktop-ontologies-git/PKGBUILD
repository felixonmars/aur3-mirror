# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=shared-desktop-ontologies-git
pkgver=20110213
pkgrel=1
pkgdesc="Ontologies necessary for the Nepomuk semantic desktop (git version)"
arch=('any')
url="http://sourceforge.net/apps/trac/oscaf/"
license=('GPL')
makedepends=('cmake' 'git')
conflicts=('shared-desktop-ontologies')
provides=('shared-desktop-ontologies')

_gitroot="git://git.code.sf.net/p/oscaf/shared-desktop-ontologies"
_gitname="shared-desktop-ontologies"

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
