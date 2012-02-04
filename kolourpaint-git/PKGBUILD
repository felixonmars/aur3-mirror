pkgname=kolourpaint-git
pkgver=20110711
pkgrel=1
pkgdesc='KolourPaint is an easy-to-use paint program'
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde.org/"
depends=('kdebase4-runtime-git' 'qimageblitz')
makedepends=('git' 'automoc4' 'cmake')
conflicts=('kdegraphics-kolourpaint')
provides=('kdegraphics-kolourpaint')
groups=('kde4-git')

_gitroot="git://anongit.kde.org/kolourpaint.git"
_gitname="kolourpaint"

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
