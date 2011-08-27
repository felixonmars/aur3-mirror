pkgname=kartesio-git
pkgver=20110502
pkgrel=1
pkgdesc='Kartesio is a program that tries to calculate a fit curve for some points'
arch=('i686' 'x86_64')
license=('GPL')
url="https://projects.kde.org/projects/playground/edu/kartesio"
depends=('kdebase-runtime' 'kdeedu-libkdeedu' 'maxima')
makedepends=('git' 'cmake' 'automoc4')

_gitroot="git://anongit.kde.org/kartesio.git"
_gitname="kartesio"

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
  if [[ -d ${srcdir}/${_gitname}-build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/${_gitname}-build
  fi
  mkdir $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build
  cmake $startdir/src/$_gitname/$_gitname -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/$_gitname-build
  make DESTDIR=${pkgdir} install
}