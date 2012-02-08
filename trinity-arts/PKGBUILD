# Maintainer: Pawel 'l0ner' Soltys <pwslts@gmail.com>
# Contributor: Calvin Morrison <mutantturkey@gmail.com>

pkgname=trinity-arts
pkgver=3513
pkgrel=5
arch=('i686' 'x86_64')
url='http://www.trinitydesktop.com'
license=('GPL')
groups=('trinity-base')
pkgdesc="Trinity ARTS Sound System and libraries"
depends=('trinity-tqtinterface'
         'audiofile' 'libmad' 'libvorbis'
         'glib2')
makedepends=('pkgconfig' 'cmake')
conflicts=('kdemod3-arts' 'arts')
options=('libtool' '!emptydirs')
source=('http://mirror.ets.kth.se/trinity/releases/3.5.13/dependencies/arts-3.5.13.tar.gz')
md5sums=('109124dabb1aaa9d44eb32e43b549142')
install='trinity-arts.install'

build() {
   msg "Setting PATH, CMAKE and Trinity Environment variables"
   # Source the QT and KDE profile
   [ "$QTDIR" = "" ] && . /etc/profile.d/qt3.sh 
   [ "$TDEDIR" = "" ] && . /etc/profile.d/trinity.sh

   cd $srcdir
   msg "Creating out-of-source build directory: ${srcdir}/build"
   mkdir -p build
   cd build

   msg "Starting cmake..."
   cmake ${srcdir}/dependencies/arts/ \
      -DCMAKE_INSTALL_PREFIX=${TDEDIR}

   msg "Building $pkgname..."
   make

}

package() {
   msg "Packaging - $pkgname-$pkgver"

   cd ${srcdir}/build
   make DESTDIR="$pkgdir" install

}
