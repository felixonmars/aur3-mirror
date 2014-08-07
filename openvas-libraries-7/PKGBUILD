# Contributor: Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >
# Maintainer:  Evaggelos Balaskas < ebalaskas _AT_ ebalaskas _DOT_ gr >

_pkgname=openvas-libraries
pkgname=${_pkgname}-7
pkgver=7.0.3
pkgrel=1
pkgdesc="libraries for the open Source vulnerability scanner"
# arch=("i686" "x86_64")
arch=("any")
url="http://openvas.org/"
license=("GPLv2 LGPLv2")
depends=(
	"glib2"
	"gnutls"
	"zlib"
	"libpcap"
	"gpgme"
	"e2fsprogs"

	"doxygen"
	"xmltoman"
	"libssh"
	"libksba"
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
source=("http://wald.intevation.org/frs/download.php/1682/${_pkgname}-${pkgver}.tar.gz")

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	mkdir build
	cd build/
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var ..
	cmake ..

	make
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}/build
	make DESTDIR=${pkgdir} install
}

md5sums=('d3a494ebe19eb67aecf716c8f75fd013')

