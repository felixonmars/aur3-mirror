# Contributor: Calvin Morrison MutantTurkey@gmail.com
pkgname=tqtinterface-svn
pkgver=3.5.12
pkgrel=1
pkgdesc="The tqtinterface provides libraries at abstract the underlying Qt system from the actual Trinity Desktop Environment"
arch=(i686 x86_64)
license=('GPL')
depends=('qt3-trinity')
makedepends=('pkgconfig' 'cmake' 'subversion') 
#conflicts=('')
#provides=('')
#options=('!emptydirs')
url="http://trinity.pearsoncomputing.net"

build() {
  svn co svn://anonsvn.kde.org/home/kde/branches/trinity/dependencies/tqtinterface
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cd ${srcdir}/tqtinterface
  cmake CMakeLists.txt -DWITH_QT3=ON \
  -DQT_INCLUDE_DIRS=/opt/qt/include/ \
  -DQT_LIBRARY_DIRS=/opt/qt/lib/
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  rm -rf ${srcdir}/$_svnmod
}
