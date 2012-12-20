# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=mountmanager
_realname_=MountManager
pkgver=0.2.6
pkgrel=1
pkgdesc="A user-friendly program, which can help you in storage devices management"
arch=("i686" "x86_64")
url="http://vialinx.org/?page_id=7&lang=en"
license=("GPL")
depends=("qt")
source=(http://linuxtuner.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	./configure --prefix=/usr

	sed -i "s#BIN=/usr/bin#BIN="${pkgdir}"/usr/bin#" Makefile
	sed -i "s#SHAREDIR=/usr/share/${pkgname}#SHAREDIR="${pkgdir}"/usr/share/${pkgname}#" Makefile
	sed -i "s#DOC=/usr/share/doc/${_realname_}#DOC="${pkgdir}"/usr/share/doc/${_realname_}#" Makefile
	sed -i "s#APPLICATIONS=/usr/share/applications#APPLICATIONS="${pkgdir}"/usr/share/applications#" Makefile
	sed -i "s#MANS=/usr/share/man/man1#MANS="${pkgdir}"/usr/share/man/man1#" Makefile
	sed -i "s#TRANSDIR=/usr/lib/${pkgname}/trans#TRANSDIR="${pkgdir}"/usr/lib/${pkgname}/trans#" Makefile
	sed -i "s#ALL_ICONS=/usr/share/icons#ALL_ICONS="${pkgdir}"/usr/share/icons#" Makefile
	sed -i "s#PLUGINS_DIR=/usr/lib/${pkgname}/plugins#PLUGINS_DIR="${pkgdir}"/usr/lib/${pkgname}/plugins#" Makefile

	make
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	make DESTDIR="${pkgdir}" install
}
