# Contributor:  sxe <sxxe@gmx.de>

pkgname=kuickshow-svn
pkgver=966770
pkgrel=1
pkgdesc="KuickShow is an image browser/viewer with a nice filebrowser to select images."
url="http://www.kde.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs' 'pkgconfig' 'imlib2' 'imlib')
makedepends=('subversion' 'cmake' 'automoc4')
provides=('kuickshow')
source=()
noextract=()
md5sums=()

build() {

  cd $srcdir
   svn co -N svn://anonsvn.kde.org/home/kde/trunk/extragear/graphics
   cd $srcdir/graphics 
   svn up kuickshow
   svn up cmake

    msg "SVN checkout done or server timeout"
    msg "Starting make..."
 
   cd $srcdir/graphics/

   cmake ./ -DCMAKE_BUILD_TYPE=debugfull -DCMAKE_INSTALL_PREFIX=/usr
   make
   make DESTDIR="$startdir/pkg" install

}
