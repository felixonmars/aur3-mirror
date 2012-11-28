pkgname=kdepim4-runtime-git
pkgver=20121128
pkgrel=1
pkgdesc='KDE PIM Runtime Environment'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('kdepimlibs4-git' 'kdebase4-runtime-git' 'libkgapi-git' 'libkolabxml-git' 'libkolab-git')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'git' 'boost')
conflicts=('kdepim-runtime')
provides=('kdepim-runtime')
groups=('kde-git')
install='kdepim4-runtime-git.install'

_gitroot="git://anongit.kde.org/kdepim-runtime"
_gitname="kdepim-runtime"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot --depth=1
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
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_SKIP_RPATH=ON
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
