pkgname=initramfs-rescue
pkgver=3.7.8
pkgrel=1
pkgdesc="initramfs with a wide range of modules and hooks"
arch=('i686' 'x86_64')
url="https://www.archlinux.org"
license=('GPL')
groups=('base')
depends=("linux=${pkgver}")
makedepends=('mkinitcpio' 'systemd-tools' 'btrfs-progs' 'cryptsetup' 'lvm2' 'mdadm' 'mkinitcpio-nfs-utils')
source=('mkinitcpio.conf')

build() {
  cd "${srcdir}"
  mkinitcpio \
	  --config mkinitcpio.conf \
	  --kernel /boot/vmlinuz-linux \
	  --generate initramfs-linux-rescue.img
}

package() {
  mkdir "${pkgdir}/boot"
  cp "${srcdir}/initramfs-linux-rescue.img" "${pkgdir}/boot"
}
md5sums=('3d32c2fb34db47b25611de4e447a7dfa')
