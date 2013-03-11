# Contributor: dragonn <dragonn at op dot pl>

pkgname=obshutdown
pkgver=0.1_rc1
pkgrel=2
pkgdesc='Openbox shutdown manager'
arch=('i686' 'x86_64')
conflicts=('obshutdown-git')
url=('https://github.com/panjandrum')
license=('GPL')
depends=('gtk2' 'cairo')
makedepends=('make')
source=("https://github.com/downloads/panjandrum/obshutdown/${pkgname}-${pkgver/_/-}.tar.gz")
sha1sums=('ade28471c3d1af3a4640e1836ea9a05634274503')




build() {
	cd "${srcdir}/${pkgname}-${pkgver/_/-}"
	./configure --prefix=/usr

	IFS=$(echo -en "\n\b");
	for i in $(grep -lR "#include <glib" src/);
	do
		sed -i 's/#include <glib\/.*>/#include <glib\.h>/g' "$i";
	done;

	make
}
package() {
	cd "${srcdir}/${pkgname}-${pkgver/_/-}"
	make DESTDIR="${pkgdir}" install
}
