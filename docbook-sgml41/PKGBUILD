# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>
pkgname='docbook-sgml41'
pkgver='4.1'
pkgrel='1'
pkgdesc='Legacy docbook-sgml for docbook-utils.'
arch=('i686' 'x86_64')
url='http://www.docbook.org/sgml/'
license=('custom')
depends=('sgml-common')
makedepends=('unzip')
#provides=()
#conflicts=()
#replaces=()
#backup=()
install='docbook-sgml.install'
source=("http://www.docbook.org/sgml/${pkgver}/docbk41.zip")
#noextract=()
md5sums=('489f6ff2a2173eb1e14216c10533ede2')
sha1sums=('3009fcc364511d186da40e828bf0d5d1556c020e')

build() {
	cd $srcdir

	local DTDDIR="usr/share/sgml/docbook-sgml-$pkgver"

	mkdir -pv $pkgdir/$DTDDIR
	chown -R 0:0 ./
	cp -v docbook.cat $pkgdir/$DTDDIR/catalog
	cp -av *.dtd *.mod *.dcl $pkgdir/$DTDDIR
}
