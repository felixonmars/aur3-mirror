# Contributor: Marvn <mistrmarvn@gmail.com>

pkgname=wicd-kde
pkgver=0.3.1
pkgrel=3
pkgdesc="Wicd client build on the KDE Development Platform"
arch=("i686" "x86_64")
url="http://kde-apps.org/content/show.php/Wicd+Client+KDE?content=132366"
license=('GPL')
depends=('kdelibs' 'qt4' 'wicd')
replaces=('wicd-client-kde')
conflicts=('wicd-client-kde')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/132366-wicd-kde-${pkgver}.tar.gz")
md5sums=('c42f4f628f70784d33a10ed32cd45e62')

build() 

{
  cd ${srcdir}/${pkgname}
  

  cmake . -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DPYTHONBIN=python2 -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 
  make
  
}

package()
{
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install
}
