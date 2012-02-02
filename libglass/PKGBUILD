#pymol PKGBUILD
#Maintainter: Eduardo M. Lopes
#modified by Carlos RÃ­os V. (aka crosvera)
pkgname=libglass
pkgver=1.0.1
pkgrel=1
pkgdesc="A library for distributed computing and cloud computing, focusing in high performance, low lag applications, particularly virtual and augmented reality."
arch=('i686' 'x86_64')
url="http://libglass.sourceforge.net/"
license=('GPL')
depends=('python' 'freeglut' 'boost' 'libstdc++5')
makedepends=()
provides=(libglass)
conflicts=(libglass)
replaces=(libglass)
install=
source=(http://sourceforge.net/projects/libglass/files/libglass/1.0.1/libglass-1.0.1.tar.bz2/download "autotestevent.cpp.patch" "autopeer.cpp.patch" )
md5sums=('55549714c5626d577afc24a807c68fab' '46a656e1697c152e92567888e166af4c' '96bca73ae4878dd753e01624f20576ce')


build() {
cd $startdir/src/
patch -Np1 -i autopeer.cpp.patch
patch -Np1 -i autotestevent.cpp.patch
cd $startdir/src/${pkgname}-${pkgver}
mkdir -p ${startdir}/pkg/usr

./configure --prefix=${startdir}/pkg/usr
make 
make install



} 
