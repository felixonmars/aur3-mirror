# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>
pkgname=libcereal-git
pkgver=20120221
pkgrel=1
pkgdesc="Library to communicate throw serial port"
arch=('i686' 'x86_64')
url="http://github.com/mfpuentear/libcereal"
license=('GPL')
depends=('glib2')
makedepends=('vala')
provides=('libcereal')
conflicts=('libcereal')
source=()
md5sums=()

_gitroot="git://github.com/mfpuentear/libcereal.git"
_gitname="libcereal"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."
  
  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
  cd ${srcdir}/${_gitname}
  
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}
  
  make DESTDIR="$pkgdir/" install
}

