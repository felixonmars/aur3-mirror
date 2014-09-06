pkgname=numix-gtk-theme
pkgver=2.3
pkgrel=1
pkgdesc="Numix is a modern flat theme with a combination of light and dark elements. It supports Gnome, Unity, XFCE and Openbox."
arch=('any')
url="http://shimmerproject.org/projects/numix/"
depends=('gtk-engine-murrine')
license=('GPL3')
source=(https://github.com/shimmerproject/Numix/archive/master.zip)
#install=${pkgname}.install
sha256sums=('4be28747c5c01bb2cc492d31cd597960b4120bdd7cfd1542a320b65738056a71')

build() {
	cd ${srcdir}/Numix-master
	rm .gitignore CREDITS LICENSE README.md
	cd ${srcdir}
	mkdir -p usr/share/themes/
	mv Numix-master usr/share/themes/Numix
}

prepare() {
	find ${srcdir} -type d ! -perm 755 -exec chmod 755 {} +
	find ${srcdir} -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership ${srcdir}/usr ${pkgdir}/
}
