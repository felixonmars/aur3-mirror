pkgname=grub-btrs
pkgver=1
pkgrel=1
pkgdesc="grub-btrfs, add support for btrfs snapshots into grub menu"
arch=(any)
url="http://pastebin.com/8nmmsR5s"
license=('GPL3')
depends=('btrfs-progs' 'bash')
backup=('etc/grub.d/41_snapshot')
source=('41_snapshot')
md5sums=('32560976976647a512dcbabd5cc7827e')

package() {
	cd "${srcdir}"
	install -Dm 744 "41_snapshot" "${pkgdir}/etc/grub.d/41_snapshot"
}
