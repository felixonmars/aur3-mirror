pkgname=libqzeitgeist-git
pkgver=20130302
pkgrel=1
pkgdesc="A Qt interface to the Zeitgeist event tracking system"
url="https://projects.kde.org/projects/kdesupport/libqzeitgeist"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4')
makedepends=('git' 'cmake' 'zeitgeist')
conflicts=('libqzeitgeist')
provides=('libqzeitgeist')
groups=('kde4-git')

_gitroot="git://anongit.kde.org/libqzeitgeist"
_gitname="libqzeitgeist"

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
  git clone $srcdir/$_gitname $srcdir/build
  sed -i -e "s|env python|env python2|" $srcdir/build/scripts/onto2cpp.py
  mkdir $srcdir/build/build
  cd $srcdir/build/build
  cmake ../ -DCMAKE_BUILD_TYPE=debugfull \
        -DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package() {
  cd ${srcdir}/build/build
  make DESTDIR=${pkgdir} install
}
