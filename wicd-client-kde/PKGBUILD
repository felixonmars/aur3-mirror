# Contributor: Marvn <mistrmarvn@gmail.com>

pkgname=wicd-client-kde
pkgver=0.2.1
pkgrel=2
pkgdesc="Wicd client build on the KDE Development Platform"
arch=("i686" "x86_64")
url="http://kde-apps.org/content/show.php/Wicd+Client+KDE?content=132366"
license=('GPL')
depends=('kdelibs' 'qt' 'wicd')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/132366-wicd-client-kde-$pkgver.tar.gz")
md5sums=('162ad45b86ea30668316095574efcf81')

build() 

{
  cd ${srcdir}/${pkgname} || return 1
  

  cmake . -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DPYTHONBIN=python2 || return 1
  make || return 1
  
}

package()
{
  cd ${srcdir}/${pkgname} || return 1
  make DESTDIR=${pkgdir} install || return 1
}