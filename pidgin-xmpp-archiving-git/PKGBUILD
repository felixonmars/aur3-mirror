# Maintainer: Deci Aria-Feathers <deciare@isisview.org>
pkgname=pidgin-xmpp-archiving-git
pkgver=0.1
pkgrel=1
pkgdesc="This Pidgin plugin implements XMPP message archiving (XEP-0136)"
url="https://github.com/danielkraic/Pidgin-XEP-0136-plugin"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('pidgin' 'libpurple')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()

build() {
	cd "${srcdir}"
	git clone git://github.com/danielkraic/Pidgin-XEP-0136-plugin.git ${pkgname}
	cd ${pkgname}

	make
}

package() {
  cd "${srcdir}/${pkgname}"
  
  mkdir -p "${pkgdir}/usr/lib/pidgin"
  cp xep136_plugin.so "${pkgdir}/usr/lib/pidgin"
}
