# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=linux-chromeos
pkgdesc="Chrome OS kernel"
pkgver=R30.4537
pkgrel=1
arch=('armv7h')
url="http://www.google.com/"
license=('custom:chromeosterms')
depends=('vboot-utils' 'chromeos-devkeys')
makedepends=('chromeos-recovery')
options=('!strip')

install=linux-chromeos.install

_chromeos_recovery=/usr/share/chromeos-recovery/chromeos-recovery.bin

_root_a_start_bytes=146800640
_kern_b_start_blocks=53248
_kern_b_size_blocks=32768

_packed_image=packed-oem-linux-chromeos

source=(linux-chromeos.install
        cmdline-linux-chromeos
        linux-chromeos-install)

md5sums=('e9092a04bd74a59490d21970e1242380'
         'ac128d634b78b112c3336cacb7a4bfb3'
         '1584e981333390948913356313a8eeb1')

build() {
  cd ${srcdir}

  mkdir -p recovery_mnt

  sudo umount -d recovery_mnt 2>/dev/null || true
  sudo mount -o loop,ro,offset=$_root_a_start_bytes -t ext2 $_chromeos_recovery recovery_mnt

  dd bs=512 skip=$_kern_b_start_blocks count=$_kern_b_size_blocks if=$_chromeos_recovery of=${srcdir}/$_packed_image
}

package() {
  cd ${srcdir}/recovery_mnt

  install -d -m 755 ${pkgdir}/usr/lib
  cp -ar lib/modules ${pkgdir}/usr/lib/modules

  cd ${srcdir}

  install -d -m 755 ${pkgdir}/boot
  install -m 644 $_packed_image ${pkgdir}/boot
  install -m 644 cmdline-linux-chromeos ${pkgdir}/boot

  install -d -m 755 ${pkgdir}/bin
  install -m 755 linux-chromeos-install ${pkgdir}/bin

  sudo umount -d recovery_mnt
}
