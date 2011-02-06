# Contributor: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=ccrypt-gui-integrations
pkgver=1.0
pkgrel=3
pkgdesc="Scripts to add shortcuts to ccrypt encryption/decryption to gnome/kde/explorer menu which allows user to encrypt/decrypt files easily. Each user must enable/disable it using ccrypt-*-install and ccrypt-*-remove binaries."
arch=('any')
license=('GPL')
url="http://ccrypt.sourceforge.net/VF/README.html"
depends=('ccrypt')
optdepends=(
	'gnome: ccrypt gui integration for gnome'
	'kde: ccrypt gui integration for kde'
)

source=(
	"http://ccrypt.sourceforge.net/VF/ccrypt_gui_integration.zip"
)

md5sums=(
	'1317d45b4cc611f8163d601f96ffb955'
)

build() {
	mkdir -p ${pkgdir}/opt/ccrypt-gui-integration
	cp ${srcdir}/ccrypt_gui_integration/* ${pkgdir}/opt/ccrypt-gui-integration

	mkdir -p ${pkgdir}/usr/share/pixmaps
	cp ${srcdir}/ccrypt_gui_integration/*.png ${pkgdir}/usr/share/pixmaps

	mkdir -p ${pkgdir}/usr/share/doc/ccrypt-gui-integrations
	cp ${srcdir}/ccrypt_gui_integration/readme ${pkgdir}/usr/share/doc/ccrypt-gui-integrations
	cp ${srcdir}/ccrypt_gui_integration/*.html ${pkgdir}/usr/share/doc/ccrypt-gui-integrations

	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/ccrypt_gui_integration/*-install ${pkgdir}/usr/bin
	cp ${srcdir}/ccrypt_gui_integration/*-remove ${pkgdir}/usr/bin

	chmod -R 755 ${pkgdir}/
}
