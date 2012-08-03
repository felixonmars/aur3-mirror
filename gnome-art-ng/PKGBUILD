# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Archie <xMickael@ifrance.com>

pkgname=gnome-art-ng
pkgver=0.7.0
pkgrel=3
pkgdesc="This is the successor of Gnome-Art and lets you change your Gnome-look (icon, wallpaper, themes) easily."
depends=('gnome-desktop2' 'gnome-sharp')
arch=('i686' 'x86_64')
license=('GPL')
source=("http://downloads.sourceforge.net/project/gnomeartng.berlios/gnomeartng-${pkgver}.tar.gz" \
	"gnome-art-ng" \
	"gnome-art-ng.desktop")
url="http://gnomeartng.plasmasolutions.de"
md5sums=('2d50f8bc164c427b047e74a0a9d1a4bd' \
	'f70435d2d3bc27aaa0a5a6b961b2b3e3' \
	'e5427a5971f0d1f23c2c80341cd9cc89')
build() {
	export MONO_SHARED_DIR="${srcdir}/.wabi"
	install -d "${MONO_SHARED_DIR}"

	install -d ${pkgdir}/usr/share/{pixmaps,applications}
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/${pkgname}

	cd ${srcdir}/gnomeartng-${pkgver}
	install -D -m644 ./images/Icon.svg  ${pkgdir}/usr/share/pixmaps/gnome-art-ng.svg
	install -D -m644 ${startdir}/gnome-art-ng.desktop ${pkgdir}/usr/share/applications/
	install -D -m755 ${startdir}/gnome-art-ng ${pkgdir}/usr/bin/

	./compile
	cp -R * ${pkgdir}/usr/share/${pkgname}
	}
