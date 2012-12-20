# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Original Maintainers and Contributors:
# Contributor: Shaika-Dzari < shaikadzari at gmail dot com>
# Zhukov Pavel <gelios@gmail.com>
# Benjamin Kircher <benjamin.kircher@gmail.com>

pkgname=qdevelop
pkgver=0.28
pkgrel=1
pkgdesc="A free and cross-platform IDE for Qt4"
arch=("i686" "x86_64")
url="http://biord-software.org/qdevelop"
license=("GPL2")
depends=("qt")
makedepends=("unzip")
optdepends=("ctags: for code completion and class browser"
			"gdb: for debugging functionalities")
source=(http://biord-software.org/downloads/${pkgname}-v${pkgver}.tar.gz)

build() {
	cd "${srcdir}"/${pkgname}-v${pkgver}

	# Init
	#sed -i -e "s/free(allinherits)/delete [] allinherits/" src/QIComplete/tree.cpp

	lrelease QDevelop.pro
	qmake
	make
}

package() {
	cd "${srcdir}"/${pkgname}-v${pkgver}

	make INSTALL_ROOT="${pkgdir}" install

	# Desktop
	install -D "${startdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
	install -D resources/images/logo.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
}

sha1sums=('1980ed021770e4f976dd20ac5e85b7c8dde6fee0')
