# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-qemu-ia32
pkgver=4
pkgrel=1
_rpmver=1.1
pkgdesc='Meego QEMU helper for MADDE'
arch=('i686' 'x86_64')
url='http://meego.gitorious.org/meego-developer-tools/meego-emulator-qemugl-x86'
license=('GPL2')
depends=('madde' 'meego-sdk-qemu-gl')
source=("http://download.meego.com/live/Tools:/SDK:/Host/Trunk/src/${pkgname}-${pkgver}-${_rpmver}.src.rpm")
md5sums=('c0945a2454947129a9734eb70595fa19')

package() {
  cd "${srcdir}"
  tar -zxf ${pkgname}_${pkgver}.tar.gz

  cd ${pkgname}-${pkgver}
  install -Dm755 qemu-meego "${pkgdir}"/opt/meego/${pkgname}/bin/qemu-meego

  tar -zcf qemu-meego.tar.gz -C "${pkgdir}"/opt/meego/${pkgname} .
  install -Dm644 qemu-meego.tar.gz \
    "${pkgdir}"/opt/meego/${pkgname}/qemu-meego.tar.gz
  rm -rf "${pkgdir}"/opt/meego/${pkgname}/bin

  install -d "${pkgdir}"/usr/lib/madde/linux-$CARCH/cache
  ln -sf /opt/meego/${pkgname}/qemu-meego.tar.gz \
    "${pkgdir}"/usr/lib/madde/linux-$CARCH/cache/

  install -d "${pkgdir}"/usr/lib/madde/linux-$CARCH/tools/qemu-meego
  tar -zxf qemu-meego.tar.gz -C "${pkgdir}"/usr/lib/madde/linux-$CARCH/tools/qemu-meego
}