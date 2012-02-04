# Contributor: Honzor <honzor at gmx net>
# Maintainer: Laszlo Papp <djszapi at gmail com>
pkgname=pk2cmd
pkgver=1.20
pkgrel=2
pkgdesc="Official Microchip Pickit2 programmer software"
arch=('i686' 'x86_64')
url="http://www.microchip.com/stellent/idcplg?IdcService=SS_GET_PAGE&nodeId=1406&dDocName=en023805"
license=('GPL')
depends=('libusb')
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/pk2cmdv1.20LinuxMacSource.tar.gz)
md5sums=('07c102f4e2d96cf03c6ea6420533265c')

build() {
  cd ${srcdir}/${pkgname}v1.20LinuxMacSource
  make linux || return 1
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/pk2cmd || return 1
  install -Dm755 PK2DeviceFile.dat ${pkgdir}/usr/share/pk2/PK2DeviceFile.dat || return 1
}

