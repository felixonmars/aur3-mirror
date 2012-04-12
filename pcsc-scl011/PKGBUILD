# Maintainer: Heiko Baums <heiko@baums-on-web.de>

pkgname=pcsc-scl011
pkgver=2.06
pkgrel=1
pkgdesc="PCSC driver for Identive (formerly SCM Microsystems) SCL011 nPA Reader"
url="http://www.identive-infrastructure.com"
license=('custom')
arch=('i686' 'x86_64')
depends=('pcsclite')
[ "$CARCH" = "i686"   ] && _arch=32bit
[ "$CARCH" = "x86_64" ] && _arch=64bit
source=(http://support.identive-infrastructure.com/download/npa/scl011_${pkgver}_linux_${_arch}.tar.gz)
[ "$CARCH" = "i686"   ] && md5sums=('04f18aeebbca688029d0783b0d0ccb2f')
[ "$CARCH" = "x86_64" ] && md5sums=('b65e80c081b4e3b7cce1715fb8e1b30e')

package() {
  cd ${srcdir}/scl011_${pkgver}_linux_${_arch}

  install -d -m755 -o root -g root ${pkgdir}/usr/share/licenses/${pkgname}
  install -d -m755 -o root -g root ${pkgdir}/usr/lib/pcsc/drivers
  install -d -m700 -o root -g root ${pkgdir}/usr/lib/pcsc/drivers/SCL011.bundle
  install -d -m700 -o root -g root ${pkgdir}/usr/lib/pcsc/drivers/SCL011.bundle/Contents
  install -d -m700 -o root -g root ${pkgdir}/usr/lib/pcsc/drivers/SCL011.bundle/Contents/Linux
  install -D -m600 -o root -g root proprietary/SCL011.bundle/Contents/Info.plist ${pkgdir}/usr/lib/pcsc/drivers/SCL011.bundle/Contents
  install -D -m700 -o root -g root proprietary/SCL011.bundle/Contents/Linux/libSCL011.so.${pkgver} ${pkgdir}/usr/lib/pcsc/drivers/SCL011.bundle/Contents/Linux
  install -D -m644 -o root -g root proprietary/license ${pkgdir}/usr/share/licenses/${pkgname}
}
