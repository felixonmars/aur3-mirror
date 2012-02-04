pkgname=ksnapshot-git
pkgver=20110711
pkgrel=1
pkgdesc='A handy utility primarily designed for taking screenshots'
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde.org/"
depends=('kdelibs4-git' 'libkipi-git')
makedepends=('git' 'automoc4' 'cmake')
optdepends=('kipi-plugins-git')
conflicts=('kdegraphics-ksnapshot')
provides=('kdegraphics-ksnapshot')
groups=('kde4-git')

_gitroot="git://anongit.kde.org/ksnapshot.git"
_gitname="ksnapshot"

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
  cmake $startdir/src/$_gitname -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/$_gitname-build
  make DESTDIR=${pkgdir} install
}
