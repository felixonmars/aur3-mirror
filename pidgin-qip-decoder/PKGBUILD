# Contributor:	Thomas Mudrunka <harvie@@email..cz>
# Maintainer:		Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=pidgin-qip-decoder
pkgver=1.3
pkgrel=1
pkgdesc="Pidgin plugin to display diacritic letters from QIP IM correctly"
arch=(i686 x86_64)
license=('GPL')
url='http://www.sedaha.cz/drupal/en/content/plugin-qip-decoder-for-pidgin'
depends=(pidgin)
source=(
	'Makefile'
	"http://www.sedaha.cz/qip-decoder/qip-decoder-${pkgver}.src.zip"
)
md5sums=('0822bbc7829e96a2edff2ed4475deb6e'
         'd1d44bb983a30340b17b139ff41ff954')

build() {
	make || return 1
	mkdir -p ${pkgdir}/usr/lib/pidgin/
	cp qip-decoder.so ${pkgdir}/usr/lib/pidgin/
	chmod -R 755 ${pkgdir}/
}
