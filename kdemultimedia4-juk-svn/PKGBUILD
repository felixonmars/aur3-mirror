# Contributor: Lawrence Lee <valheru@facticius.net>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>
pkgname=kdemultimedia4-juk-svn
arch=('i686' 'x86_64')
pkgdesc="KDE JuK"
pkgver=1282608
pkgrel=1
url="http://kde.org/applications/multimedia/juk/"
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'kdelibs' 'tunepimp')
depends=('kdebase-runtime' 'tunepimp')
conflicts=('kdemultimedia-juk')
install="juk-svn.install"

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdemultimedia
_svnmod=kdemultimedia

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi 

  mkdir ${srcdir}/build
  cd ${srcdir}/build
  cmake $startdir/src/$_svnmod -DCMAKE_BUILD_TYPE=reldebug \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr
  cd juk
  make
}
package() {
    cd ${srcdir}/build/juk/
    make DESTDIR=${pkgdir} install
}

