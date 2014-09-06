pkgname=bluebird-gtk-theme
pkgver=1.2
pkgrel=1
pkgdesc="Bluebird is the default theme in Xubuntu 10.10."
arch=('any')
url="http://shimmerproject.org/projects/bluebird/"
depends=('gtk-engine-murrine')
license=('GPL3')
source=(https://github.com/shimmerproject/Bluebird/archive/master.zip)
sha256sums=('ebf52f1860df1ace3141943869832c417522e10d5c7b7604f3e0c47a590ade43')

build() {
	cd ${srcdir}/Bluebird-master
	rm .gitignore LICENSE* README
	cd ${srcdir}
	mkdir -p usr/share/themes/
	mv Bluebird-master usr/share/themes/Bluebird
}

prepare() {
	find ${srcdir} -type d ! -perm 755 -exec chmod 755 {} +
	find ${srcdir} -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership ${srcdir}/usr ${pkgdir}/
}
