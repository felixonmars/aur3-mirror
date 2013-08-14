# Contributer: giacomogiorgianni@gmail.com 

pkgname=liblaretz
pkgver=20130415
pkgrel=1
pkgdesc='"Shared library to be used by the Laretz sync server and its clients.'
arch=('i686' 'x86_64')
url='http://leechcraft.org'
license=('Boost-1.0')
depends=('mongodb')
makedepends=('cmake' 'git' 'doxygen')
#conflicts=('')
#provides=('')
#groups=('kde-git')

_gitroot="git://github.com/0xd34df00d/laretz.git"
_gitname="laretz"

build() {
  cd $srcdir
  if [[ -d ${srcdir}/$_gitname ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/$_gitname
  fi
    
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
  #if [[ -d ${srcdir}/build ]]; then
  #  msg "Cleaning the previous build directory..."
  #  rm -rf ${srcdir}/build
  #fi
  #mkdir $srcdir/build
  cd $srcdir/$_gitname
  cmake $startdir/src/$_gitname/src -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/$_gitname
  #make DESTDIR=${pkgdir} install
  sed -i "5s|/usr|${pkgdir}/usr|" $srcdir/$_gitname/cmake_install.cmake
  make CMAKE_INSTALL_PREFIX=${pkgdir} install
}
