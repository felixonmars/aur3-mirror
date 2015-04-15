#Contributor: Andrea Scarpino <andrea@archlinux.org>
#Mainteiner : Tobias Heimfarth <emaildotobias@yahoo.com.br>
pkgname=labplot2
_pkgname=labplot
pkgver=2.0.2
pkgrel=1
pkgdesc="A free software data analysis and visualization application"
arch=('i686' 'x86_64')
url='http://labplot.sourceforge.net/'
license=('GPL')
depends=('kdelibs' 'hdf5' 'netcdf' 'gsl')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/${_pkgname}/${pkgver}/src/${_pkgname}-${pkgver}.tar.xz")
md5sums=('18ec579b11c9ff136f90d67ae4c23faf')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./compile
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make DESTDIR="${pkgdir}" install
}


