# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=kdeplasma-runners-vbox
_srcname=vbox-runner
pkgver=0.3.3
pkgrel=3
pkgdesc="Allows starting VirtualBox virtual machines from Krunner"
arch=('i686' 'x86_64')
depends=('kdebase-workspace>=4.3')
makedepends=('cmake' 'automoc4')
url="http://kde-look.org/content/show.php/VBox+Runner?content=107926"
license=('GPL')
source=(http://kde-look.org/CONTENT/content-files/107926-${_srcname}-${pkgver}.tar.gz)
sha1sums=('5bd84799509065aabd52108df01fe47d6ef61677')

build()
{
  cd ${srcdir}
  mkdir build && cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`\
  	-DCMAKE_BUILD_TYPE=Release \
	-DQT_QMAKE_EXECUTABLE=qmake4 \
  	 ../${_srcname}-${pkgver}
  make
}

package()
{
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
