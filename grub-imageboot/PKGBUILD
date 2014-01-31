# Maintainer: Max Roder <maxroder@web.de>

pkgname='grub-imageboot'
pkgver='0.6'
pkgrel='2'
pkgdesc="grub2 script to automatically add boot entries for iso images placed in /boot/images/"
url="https://launchpad.net/ubuntu/+source/grub-imageboot/"
arch=('any')
license=('GPL')
depends=('syslinux' 'grub')
install='grub-imageboot.install'
source=("http://deb.grml.org/pool/main/g/grub-imageboot/${pkgname}_${pkgver}.tar.gz")
sha256sums=('dbb928ed24acc38bc93c6aa671564ff077b7a35b0a7ceacd12c805b72d987ad2')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# patch file
	sed -i 's/\/usr\/lib\/grub/\/usr\/share\/grub/g' bin/60_grub-imageboot

	install -Dm755 bin/60_grub-imageboot ${pkgdir}/etc/grub.d/60_grub-imageboot
	install -Dm644 etc/grub-imageboot ${pkgdir}/etc/default/grub-imageboot
	install -d ${pkgdir}/boot/images
}

# vim:set ts=2 sw=2 et:
