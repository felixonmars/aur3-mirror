# Maintainer: fledge (Giorgio Daino) <g.daino@tele2.it>

pkgname=digikam-beta
appname=digikam
pkgver=1.0.0
pkgrel=10
pkgdesc="Digital photo management application for kde"
arch=(i686 x86_64)
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('libgphoto2' 'lcms' 'kdegraphics-libs' 'jasper>=1.900.1' 'kdeedu-marble')
makedepends=('pkgconfig' 'cmake' 'automoc4')
source=(http://downloads.sourceforge.net/digikam/${appname}-${pkgver}.tar.bz2)
conflicts=('digikam')
provides=('digikam')
replaces=('digikamimageplugins')
optdepends=('kipi-plugins: for more extras and plugins' 'kdepimlibs: to support KAddressBook entries' 'lensfun: to support LensCorrection editor plugin' 'liblqr: for Liquid Rescale tool')
md5sums=('6169deb68a3d712a0c6539b09c5f8c0c')

build() {
  cd ${srcdir}/${appname}-${pkgver}
   cmake . -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_MARBLEWIDGET=yes -DWITH_MarbleWidget=yes
   make all|| return 1
   make DESTDIR=${pkgdir} install || return 1
 }
