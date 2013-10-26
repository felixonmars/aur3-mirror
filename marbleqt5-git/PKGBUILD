# Maintainer: DasMoeh <belgarath19@web.de>

pkgname=marbleqt5-git
pkgver=20131810
pkgrel=1
pkgdesc="Virtual Globe and World Atlas (Qt5 / QTONLY)"
arch=('i686' 'x86_64')
url="http://edu.kde.org/marble"
license=('LGPL2.1')
depends=('qt5-webkit' 'qt5-svg' 'qt5-script' 'gpsd')
makedepends=('cmake' 'git')
install=marble.install
conflicts=('kdeedu-marble' 'marble')
source=('marble.install')
md5sums=('6739298b76a621e9be8ef29c7337bafd')

_gitroot=git://anongit.kde.org/marble.git
_gitname=marble


build() {
   cd $srcdir

   msg "Connecting to GIT server...."

   if [ -d $srcdir/$_gitname ] ; then
     cd $_gitname && git pull --rebase
	  git checkout qt5
   else
     git clone $_gitroot
	  cd $_gitname
	  git checkout qt5
   fi

   msg "GIT checkout done or server timeout"
   msg "Starting installation..."

   cd $srcdir
	if [ ! -d build ]; then
	   mkdir build
	fi
   cd build
	cmake -DCMAKE_BUILD_TYPE=debug -DQTONLY=1 -DQT5BUILD=1 -DCMAKE_INSTALL_PREFIX=/usr ../marble
   make
}

package() {   
   cd $srcdir/build
   make DESTDIR=$pkgdir install
}
