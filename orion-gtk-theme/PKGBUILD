pkgname=orion-gtk-theme
pkgver=1.5
pkgrel=1
pkgdesc="Orion is a modern light theme for Gnome. It supports Gnome, Unity, XFCE and Openbox. The theme is compatible with GTK 3.6 and 3.8. It also includes a GTK 2.0 theme using Murrine engine."
arch=('any')
url="http://shimmerproject.org/projects/orion/"
depends=('gtk-engine-murrine')
license=('GPL3')
source=(https://github.com/shimmerproject/Orion/archive/master.zip)
#install=${pkgname}.install
sha256sums=('9764204ab413079e724a85d0a6bba2e578357fa923773fc02f7fbf730a675897')

build() {
	cd ${srcdir}/Orion-master
	rm .gitignore LICENSE README
	cd ${srcdir}
	mkdir -p usr/share/themes/
	mv Orion-master usr/share/themes/Orion
}

prepare() {
	find ${srcdir} -type d ! -perm 755 -exec chmod 755 {} +
	find ${srcdir} -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership ${srcdir}/usr ${pkgdir}/
}
