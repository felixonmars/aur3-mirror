# Contributor: tyr0 <thomas.hoernes@gmx.at>
# Contributor: Nicolas Quienot <niQo @ aur>
pkgname=kding
pkgver=0.6
pkgrel=1
pkgdesc="KDing is a KDE port of Ding, a dictionary lookup program."
url="http://www.rexi.org/software/kding/"
license=('GPL')
depends=('kdelibs')
arch=('i686' 'x86_64')
source=(http://www.rexi.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('539e180da484aa29b3a581046b01b7fe')
optdepends=('agrep:  for advanced search') 

build() {
  #cd $startdir/src/$pkgname-$pkgver
  #cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
} 
