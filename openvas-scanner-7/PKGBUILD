# Contributor: Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >
# Maintainer:  Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >

_pkgname=openvas-scanner
pkgname=${_pkgname}-7
pkgver=4.0.2
pkgrel=1
pkgdesc="This is the scanner module for the Open Vulnerability Assessment System"
# arch=("i686" "x86_64")
arch=("any")
url="http://openvas.org/"
license=("GPLv2")
depends=(
	"openvas-libraries"
)
makedepends=(
        "bison"
	"flex"
        "cmake"
        "pkg-config"
)
optdepends=(
)
provides=${_pkgname}
options=(!emptydirs)
source=("http://wald.intevation.org/frs/download.php/1686/${_pkgname}-${pkgver}.tar.gz")

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	mkdir build
	cd build/
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var ..

	make
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}/build
	make DESTDIR=${pkgdir} install
}

md5sums=('99e53eeaaa086abd3515a8e2488ebf1c')
