# Contributor: Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >
# Maintainer:  Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >

_pkgname=greenbone-security-assistant
pkgname=${_pkgname}
pkgver=5.0.2
pkgrel=1
pkgdesc="a web application that connects to the OpenVAS Manager and OpenVAS Administrator"
# arch=("i686" "x86_64")
arch=("any")
url="http://openvas.org/"
license=("GPLv2")
depends=(
	"libmicrohttpd"
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
source=("http://wald.intevation.org/frs/download.php/1694/${_pkgname}-${pkgver}.tar.gz")

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

md5sums=('d05d6cdb4555d9aea12abbd67e651e0d')
