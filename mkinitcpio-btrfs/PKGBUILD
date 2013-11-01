# Contributor: C Anthony Risinger
# Contributor: Michael Göhler
pkgname='mkinitcpio-btrfs'
pkgver=0.4.0
pkgrel=2
pkgdesc='[initramfs] Rollback operations on BTRFS-based root devices'
url='https://github.com/xtfxme/mkinitcpio-btrfs'
arch=('any')
license=('BSD')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0' 'btrfs-progs' 'kexec-tools')
source=('btrfs_hook' 'btrfs_install' 'btrfs_config')

package() {
    install -o root -g root -D ${srcdir}/btrfs_install ${pkgdir}/usr/lib/initcpio/install/btrfs_advanced
    install -o root -g root -D ${srcdir}/btrfs_hook    ${pkgdir}/usr/lib/initcpio/hooks/btrfs_advanced
    install -o root -g root -D ${srcdir}/btrfs_config  ${pkgdir}/etc/default/btrfs_advanced
}

md5sums=('acdbaa277e58ffbc86332736997bafb2'
         '8198a307fe8a38195016e7265833473c'
         'dc9e745e44e9c9c3c4a2de5aa48ce3e1')
