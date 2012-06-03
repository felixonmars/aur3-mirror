# Contributor: C Anthony Risinger
pkgname='mkinitcpio-btrfs'
pkgver=0.3.2
pkgrel=0
pkgdesc='[initramfs] Rollback operations on BTRFS-based root devices'
url='http://btrfs.wiki.kernel.org'
arch=('any')
license=('BSD')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0' 'btrfs-progs')
source=('btrfs_hook' 'btrfs_install')

build() {
    install -o root -g root -D ${srcdir}/btrfs_install ${pkgdir}/usr/lib/initcpio/install/btrfs_advanced
    install -o root -g root -D ${srcdir}/btrfs_hook ${pkgdir}/usr/lib/initcpio/hooks/btrfs_advanced
}

md5sums=('ce76b1f3dfd6740d9a9bbf40c6f97248'
         '9b412042b9e4151533caf013ce69e973')
