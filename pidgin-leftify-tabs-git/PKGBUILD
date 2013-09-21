# Maintainer: Miika-Petteri Matikainen <miikapetteri@gmail.com>
pkgname=pidgin-leftify-tabs-git
pkgver=20130921
pkgrel=1
pkgdesc="Pidgin plugin to move conversation tabs to left whenever a message arrives"
url="https://github.com/nablaa/pidgin-leftify-tabs-plugin"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('pidgin' 'libpurple')
optdepends=()
makedepends=()
conflicts=('pidgin-leftify-tabs')
replaces=()
backup=()

build() {
	cd "${srcdir}"
	git clone git://github.com/nablaa/pidgin-leftify-tabs-plugin.git ${pkgname}
	cd ${pkgname}

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	mkdir -p "${pkgdir}/usr/lib/pidgin"
	cp leftify_tabs.so "${pkgdir}/usr/lib/pidgin"
}
