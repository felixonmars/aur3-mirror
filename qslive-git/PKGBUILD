# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=qslive-git
pkgver=20130303
pkgrel=1
pkgdesc="A Qt front-end of sopcast, Online p2p TV Player, using phonon multimedia framework."
arch=('i686' 'x86_64')
url="https://github.com/hjf004/QSLive"
license=('GPL2')
depends=('phonon' 'qt4' 'sopcast')
makedepends=('git')
conflicts=('qslive')

_gitroot=https://github.com/hjf004/QSLive.git
_gitname=QSLive


build() {
   cd $srcdir

   msg "Connecting to GIT server...."

   if [ -d $srcdir/$_gitname ] ; then
     cd $_gitname && git pull --rebase
   else
     git clone $_gitroot
   fi

   msg "GIT checkout done or server timeout"
   msg "Starting installation..."

  cd "${srcdir}/$_gitname"

  sed -i "s:/usr/local:/usr:g" QSLive.pro
  qmake-qt4
  make
}

package() {
  cd "${srcdir}/$_gitname"

  make INSTALL_ROOT=$pkgdir install
}