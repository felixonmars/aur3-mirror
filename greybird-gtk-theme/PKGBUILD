
pkgname=greybird-gtk-theme
pkgver=1.4
pkgrel=1
pkgdesc="Greybird is the default theme in Xubuntu 11.04 onwards."
arch=('any')
url="http://shimmerproject.org/projects/greybird/"
depends=('gtk-engine-murrine')
license=('GPL3')
source=(https://github.com/shimmerproject/Greybird/archive/master.zip)
sha256sums=('8e341785d3133db2384aeb6aa2bf066a746d544a60a00a8d151b620d734ce224')

build() {	
	cd ${srcdir}/Greybird-master
	rm .gitignore LICENSE* README
	cd ${srcdir}
	mkdir -p usr/share/themes/
	mv Greybird-master usr/share/themes/Greybird
}

prepare() {
	find ${srcdir} -type d ! -perm 755 -exec chmod 755 {} +
	find ${srcdir} -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership ${srcdir}/usr ${pkgdir}/
}