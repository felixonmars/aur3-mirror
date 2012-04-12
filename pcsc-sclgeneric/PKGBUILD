# Maintainer: Heiko Baums <heiko@baums-on-web.de>

pkgname=pcsc-sclgeneric
pkgver=2.09
pkgrel=1
pkgdesc="PCSC driver for Identive (formerly SCM Microsystems) SCL010/SCL011G/SCL3711/SCR331CL RFID Reader"
url="http://www.identive-infrastructure.com"
license=('custom')
arch=('i686' 'x86_64')
depends=('pcsclite')
[ "$CARCH" = "i686"   ] && _arch=32bit
[ "$CARCH" = "x86_64" ] && _arch=64bit
source=("http://support.identive-infrastructure.com/download.php?ref=support&file=driver/SCL_generic_linux_${_arch}_driver_V${pkgver}.tar.gz")
[ "$CARCH" = "i686"   ] && md5sums=('e2832290a9b72b4b34faba1342aab48d')
[ "$CARCH" = "x86_64" ] && md5sums=('8f1750287bc0916f9e8bef83fd5565b7')

package() {
  cd ${srcdir}/sclgeneric_${pkgver}_linux_${_arch}

  install -d -m755 -o root -g root ${pkgdir}/usr/share/licenses/${pkgname}
  install -d -m755 -o root -g root ${pkgdir}/usr/lib/pcsc/drivers
  install -d -m700 -o root -g root ${pkgdir}/usr/lib/pcsc/drivers/SCLGENERIC.bundle
  install -d -m700 -o root -g root ${pkgdir}/usr/lib/pcsc/drivers/SCLGENERIC.bundle/Contents
  install -d -m700 -o root -g root ${pkgdir}/usr/lib/pcsc/drivers/SCLGENERIC.bundle/Contents/Linux
  install -D -m600 -o root -g root proprietary/SCLGENERIC.bundle/Contents/Info.plist ${pkgdir}/usr/lib/pcsc/drivers/SCLGENERIC.bundle/Contents
  install -D -m700 -o root -g root proprietary/SCLGENERIC.bundle/Contents/Linux/libSCLGENERIC.so.${pkgver} ${pkgdir}/usr/lib/pcsc/drivers/SCLGENERIC.bundle/Contents/Linux
  install -D -m644 -o root -g root proprietary/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
