# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=chromeos-devkeys
pkgdesc="Chrome OS vboot keys"
pkgver=R30.4537
pkgrel=1
arch=('armv7h')
url="http://www.google.com/"
license=('custom:chromeosterms')
depends=('vboot-utils')
makedepends=('chromeos-recovery')
options=('!strip')

_chromeos_recovery=/usr/share/chromeos-recovery/chromeos-recovery.bin

_root_a_start_bytes=146800640

build() {
  cd ${srcdir}

  mkdir -p recovery_mnt

  sudo umount -d recovery_mnt || true
  sudo mount -o loop,ro,offset=$_root_a_start_bytes -t ext2 $_chromeos_recovery recovery_mnt
}

package() {
  cd ${srcdir}/recovery_mnt

  install -d -m 755 ${pkgdir}/usr/share/vboot/devkeys
  install -m 644 usr/share/vboot/devkeys/* ${pkgdir}/usr/share/vboot/devkeys

  cd ${srcdir}
  sudo umount recovery_mnt
}
