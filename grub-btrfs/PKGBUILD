pkgname=grub-btrfs
pkgver=0.1
pkgrel=1
pkgdesc="grub-btrfs, add support for btrfs snapshots into grub menu"
arch=('any')
url="https://github.com/Antynea/grub-btrfs"
license=('GPL3')
depends=('btrfs-progs' 'bash' 'grub')
backup=('etc/grub.d/41_snapshots-btrfs')
source=('41_snapshots-btrfs')
md5sums=('32560976976647a512dcbabd5cc7827e')

package() {
	cd "${srcdir}"
	install -Dm 755 "41_snapshots-btrfs" "${pkgdir}/etc/grub.d/41_snapshots-btrfs"
}
