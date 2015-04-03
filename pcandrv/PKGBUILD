# Maintainer: Alexander Stuehring <alexander.stuehring@gmail.com>

pkgname=pcandrv
pkgver=7.14
pkgrel=1
pkgdesc='The PCAN drivers for LINUX (kernel module)'
url='http://www.peak-system.com/fileadmin/media/linux/'
license=('GPL')
arch=('i686' 'x86_64')
source=("http://www.peak-system.com/fileadmin/media/linux/files/peak-linux-driver-${pkgver}.tar.gz")
sha1sums=('53eba64f9178c978764a90df61b01b78ad0b83be')

depends=('linux-headers')

build() {
  cd "${srcdir}/peak-linux-driver-${pkgver}/driver/"
 
  make RT_CFLAGS="-Wno-error=date-time"
}

package() {
  mkdir -p "${pkgdir}/etc/modprobe.d/"
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  
  cd "${srcdir}/peak-linux-driver-${pkgver}/driver/"
  make DESTDIR="${pkgdir}" install
 
  mv "${pkgdir}/usr/local/bin/" "${pkgdir}/usr/bin/"
  mv "${pkgdir}/lib/" "${pkgdir}/usr/lib/"
}

