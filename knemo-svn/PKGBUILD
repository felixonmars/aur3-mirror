pkgname=knemo-svn
pkgver=1226605
pkgrel=1
pkgdesc="The KDE Network Monitor"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=12956"
license=('GPL')
depends=('kdebase-workspace' 'wireless_tools' 'iw')
makedepends=('subversion' 'cmake' 'pkgconfig' 'automoc4')
conflicts=('knemo')
provides=('knemo')

_svntrunk='svn://anonsvn.kde.org/home/kde/trunk/extragear/network/knemo'
_svnmod=knemo

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  if [[ -d ${srcdir}/${_svnmod}-build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/${_svnmod}-build
  fi 

  mkdir $_svnmod-build
  cd $_svnmod-build
  cmake $startdir/src/$_svnmod -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd ${srcdir}/$_svnmod-build
  make DESTDIR=${pkgdir} install
}
		