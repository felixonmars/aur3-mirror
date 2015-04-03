# Maintainer: Alexander Stuehring <alexander.stuehring@gmail.com>

pkgname=libpcan
pkgver=7.14
pkgrel=1
pkgdesc='The PCAN drivers for LINUX (library)'
url='http://www.peak-system.com/fileadmin/media/linux/'
license=('LGPL')
arch=('i686' 'x86_64')
source=("http://www.peak-system.com/fileadmin/media/linux/files/peak-linux-driver-${pkgver}.tar.gz")
sha1sums=('53eba64f9178c978764a90df61b01b78ad0b83be')

depends=('pcandrv')

build() {
  cd "${srcdir}/peak-linux-driver-${pkgver}/lib/"

  make
}

package() {
  cd "${srcdir}/peak-linux-driver-${pkgver}/lib/"

  make DESTDIR="${pkgdir}" install
}

