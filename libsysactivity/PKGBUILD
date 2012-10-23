# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>
pkgname=libsysactivity
pkgver=0.6.4
pkgrel=1
pkgdesc="A lightweight library that retrieves statistics of the system's activity in a portable and thread safe way."
url="http://sourceforge.net/projects/libsysactivity/"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('ff608ad4b1e589f03b5b1aa664fecfd8')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build 
  fi
  mkdir ${srcdir}/build
  cd ${srcdir}/build 
  cmake ${srcdir}/libsysactivity-${pkgver} -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release
  make
}

package() { 
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
