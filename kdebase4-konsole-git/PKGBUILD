pkgname=kdebase4-konsole-git
pkgver=20110615
pkgrel=1
pkgdesc="KDE's terminal emulator."
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('kdebase4-runtime-git')
makedepends=('cmake' 'git' 'automoc4')
conflicts=('kdebase-konsole')
provides=('kdebase-konsole')
groups=('kde4-git')

_gitroot="git://anongit.kde.org/konsole"
_gitname="konsole"


build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi
  mkdir $srcdir/build
  cd $srcdir/build
  cmake $startdir/src/$_gitname -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}