# pkgbuild by peter feigl <peter.feigl@jku.at>
pkgname=mkhexgrid
pkgver=0.1.1
pkgrel=1
pkgdesc="A fully-configurable hex grid generator"
arch=('i686' 'x86_64')
url="http://www.nomic.net/~uckelman/mkhexgrid/"
license=('unknown')
source=(http://www.nomic.net/~uckelman/${pkgname}/releases/${pkgname}-${pkgver}.src.tar.bz2)
depends=(boost gd)
build()
{
  # Extract
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i -e 's/catch (exception /catch (std::exception /' mkhexgrid.cpp
  sed -i -e '/#include <stdexcept>/ i\
	 #include <cstring>' grid.cpp
  sed -i -e '/#include <sstream>/ i\
	 #include <cstring>' png.cpp

  make DESTDIR=${pkgdir}/usr || exit -1
  make DESTDIR=${pkgdir}/usr install || exit -1
	
}

md5sums=('5a0bdedbee65c97144288cd91e4415db')
