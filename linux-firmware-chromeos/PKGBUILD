# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=linux-firmware-chromeos
pkgdesc="Chrome OS firmware"
pkgver=R30.4537
pkgrel=1
arch=('armv7h')
url="http://www.google.com/"
license=('custom:chromeosterms')
makedepends=('chromeos-recovery')
options=('!strip')

_chromeos_recovery=/usr/share/chromeos-recovery/chromeos-recovery.bin

_root_a_start_bytes=146800640

build() {
  cd ${srcdir}

  mkdir -p recovery_mnt

  sudo umount -d recovery_mnt 2>/dev/null || true
  sudo mount -o loop,ro,offset=$_root_a_start_bytes -t ext2 $_chromeos_recovery recovery_mnt
}

package() {
  cd ${srcdir}/recovery_mnt

  install -d -m 755 ${pkgdir}/usr/lib
  cp -ar lib/firmware ${pkgdir}/usr/lib/firmware

  cd ${srcdir}

  sudo umount -d recovery_mnt
}
