pkgname=kcm-rcconf-settings
pkgver=0.5
pkgrel=2
url="http://sourceforge.net/projects/chakra/"
pkgdesc="RcConf Settings is a KCM for managing the main system config file rc.conf"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://downloads.sourceforge.net/sourceforge/chakra/Tools/Rcconf-Settings/rcconf-settings-${pkgver}.tar.gz)
md5sums=('d4e2094c634a0d404b1870b40bf69f0d')

build(){
cd ${srcdir}
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build 
  fi
  mkdir ${srcdir}/build
  cd ${srcdir}/build 
  cmake ${srcdir}/rcconf-settings-${pkgver} -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release
  make
}

package() { 
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
