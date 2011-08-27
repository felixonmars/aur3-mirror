# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=digikam-slim
_origpkgname=digikam
pkgver=0.10.0
pkgrel=1
pkgdesc="Digital photo management application for kde"
arch=(i686 x86_64)
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('libgphoto2' 'lcms' 'libkdcraw>=0.4.1' 'libkexiv2>=0.4.0' 'libkipi>=0.3.0' 'jasper>=1.900.1' 'lensfun')
makedepends=('pkgconfig' 'cmake')
conflicts=('digikam')
provides=('digikam')
source=(http://downloads.sourceforge.net/digikam/${_origpkgname}-0.10.0.tar.bz2)
replaces=('digikamimageplugins')
optdepends=('kipi-plugins-slim: for more extras and plugins')
md5sums=('6c6daf958ff4fe93974f1074ba967cd9')

build() {
  cd ${srcdir}/${_origpkgname}-0.10.0
   cmake . -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_MARBLEWIDGET=no -DWITH_MarbleWidget=no
   make all|| return 1
   make DESTDIR=${pkgdir} install || return 1
 }
