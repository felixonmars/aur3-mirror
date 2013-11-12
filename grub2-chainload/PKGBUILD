# Contributor: Ron Simart
pkgname=grub2-chainload
pkgver=0.1
pkgrel=2
pkgdesc="Automatly generate chainload entries for Grub2"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=116075"
license=('GPL-2')
depends=('util-linux')
source=('40_chainloader.sh')
md5sums=('b5bea49d8710286818d94f4e982ec25c')

package() {
	install -Dm 755 $srcdir/40_chainloader.sh ${pkgdir}/etc/grub.d/40_chainload
	msg "To generate chainload entries run"
	msg "	grub-mkconfig -o /boot/grub/grub.cfg"
	msg ""
}
