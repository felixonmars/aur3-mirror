# Contributor: Patrick Kelly <kameo76890@gmail.com>

pkgname="xml-ada"
pkgver="3.1"
pkgrel="w"
pkgdesc="XML/Ada is a set of modules that provide a simple manipulation of XML streams. It supports the whole XML 1.1 specifications, and can parse any file that follows this standard (including the contents of the DTD, although no validation of the document is done based on those)."
arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/xmlada/"
license=('GPL')
groups=("ada-dev")
depends=("gcc" "gcc-ada")
makedepends=("")
optdepends=("")
provides=("xml-ada")
conflicts=("")
replaces=("")
backup=("")
options=("")
install=
source=("http://www.gfortran.org/download/linux/src/xmlada-gpl-for-gps-4.3.1-src.tgz")
noextract=("")
md5sums=("d0b2ce94fda3a8b0898bfc1209dd682f")

build() {
	cd xmlada-$pkgver$pkgrel
	./configure --prefix=$startdir/pkg
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
