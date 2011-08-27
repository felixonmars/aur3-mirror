# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>
pkgname='docbook-sgml31'
pkgver='3.1'
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
source=("http://www.docbook.org/sgml/${pkgver}/docbk31.zip")
#noextract=()
md5sums=('432749c0c806dbae81c8bcb70da3b5d3')
sha1sums=('75a5bb4f17b17ff0f7dd1cc2db7112bad0fb89e6')

build() {
	cd $srcdir

	local DTDDIR="usr/share/sgml/docbook-sgml-$pkgver"

	mkdir -pv $pkgdir/$DTDDIR
	chown -R 0:0 ./
	cp -v docbook.cat $pkgdir/$DTDDIR/catalog
	cp -av *.dtd *.mod *.dcl $pkgdir/$DTDDIR
}
