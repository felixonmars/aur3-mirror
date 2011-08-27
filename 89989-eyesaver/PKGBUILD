# author: Alessandro  Preziosi
# PKGBUILD contributor: dodox
# screenlock patch: dodox

pkgname=89989-eyesaver
pkgver=0.2a
pkgrel=2
pkgdesc="This plasmoid is to remind us to take our eyes off the screen."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Eyesaver?content=89989"
license=('GPL') 
depends=('kdelibs') 
source=(http://www.kde-look.org/CONTENT/content-files/${pkgname}-${pkgver}.tar.gz)
md5sums=('de5c34cdec30d1ba61399ff78af196a5')
 
build() { 

#  cd $startdir/src/$pkgname-$pkgver
  cd $startdir/src/eyesaver/eyesaver-0.1
  patch -Np1 -i ../../../eyesaver.patch || return 1
  cp ../../../screensaver_interface.* ./
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make || return 1 
  make DESTDIR=$startdir/pkg install || return 1

}  
