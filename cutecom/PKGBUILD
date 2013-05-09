pkgname=cutecom
pkgver=0.22.0
pkgrel=2
pkgdesc="A graphical serial terminal"
arch=('i686' 'x86_64')
url="http://cutecom.sourceforge.net"
license=('GPL2')
depends=('qt4')
makedepends=('cmake')
source=(${url}/${pkgname}-${pkgver}.tar.gz ${pkgname}.desktop)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	cmake -DQT_QMAKE_EXECUTABLE=qmake4 .
	make || return 1

	install -D -m 755 cutecom ${pkgdir}/usr/bin/cutecom
	install -D -m 644 cutecom.1 ${pkgdir}/usr/man/man1/cutecom.1
	install -D -m 644 ../cutecom.desktop ${pkgdir}/usr/share/applications/cutecom.desktop
}
md5sums=('dd85ceecf5a60b4d9e4b21a338920561'
         'b34484d7c967819d54e469eeb07c8624')
sha256sums=('1b6620a6159cf3d50bb36cce544e91486817df7f1d553bf239d6db6108dd2ea5'
            '8e1c824cdcee0ea74a1bc425f1720f17b89f51bbd1fcb28a7669ffb4f2bb0ddf')
