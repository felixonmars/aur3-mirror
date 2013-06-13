# Maintainer: JKAbrams <JKAbrams at AUR>
# Contributer: Pascal E. <archlinux at hardfalcon dot net>
# Contributor: Giovanni Scafora <giovanni at archlinux dot org>
# Contributor: Daniel Plaza <daniel at plaza.espi dot gmail.com>

pkgname=pcsclite-libudev
pkgver=1.8.8
pkgrel=3
pkgdesc="PC/SC Architecture smartcard middleware library. This version uses udev instead of libusb"
arch=('i686' 'x86_64')
url="https://alioth.debian.org/projects/pcsclite/"
license=('BSD')
depends=('udev' 'python2' 'systemd')
makedepends=('pkgconfig')
provides=('pcsclite')
conflicts=('pcsclite')
options=('!libtool' '!docs')
source=(https://alioth.debian.org/frs/download.php/file/3862/pcsc-lite-${pkgver}.tar.bz2)
sha256sums=('fe66354a7e738d3ef8b4e572c7e447b85894da9262381fbf004e8abcc12885e7')

build() {
  cd "${srcdir}/pcsc-lite-${pkgver}"

  sed -i -e "s:python:python2:g" src/spy/pcsc-spy

  ./configure --prefix=/usr \
	      --sbindir=/usr/bin \
              --enable-libudev \
              --disable-libusb \
              --sysconfdir=/etc \
              --enable-ipcdir=/run/pcscd \
              --enable-usbdropdir=/usr/lib/pcsc/drivers \
              --with-systemdsystemunitdir=/usr/lib/systemd/system
  make
}

package() {
  cd "${srcdir}/pcsc-lite-${pkgver}"

  make DESTDIR=${pkgdir} install

  install -D -m644 ${srcdir}/pcsc-lite-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -d ${pkgdir}/usr/lib/pcsc/drivers
}
