# Contributor: Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >
# Maintainer:  Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >

_pkgname=openvas-manager
pkgname=${_pkgname}-7
pkgver=5.0.3
pkgrel=1
pkgdesc="a layer between the OpenVAS Scanner and various client applications"
# arch=("i686" "x86_64")
arch=("any")
url="http://openvas.org/"
license=("GPLv2 LGPLv2")
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
source=("http://wald.intevation.org/frs/download.php/1690/${_pkgname}-${pkgver}.tar.gz")

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

md5sums=('42239d4ae6d39db67e891a532fb0df51')
