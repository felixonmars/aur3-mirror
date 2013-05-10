##
# Contributor: Todd Harbour <aur@quadronyx.org>
# Comments: 
# Binary version available from: http://www.quadronyx.org/aur/
# Debian patches from: http://oldarchive.trisquel.info/trisquel/pool/main/w/wmxmms2/
##

pkgname=wmxmms2
pkgver=0.6
pkgrel=2
pkgdesc="A WindowMaker dockapp client for XMMS2 that displays a scrolling title, and provides controls for play/stop etc"
arch=('i686' 'x86_64')
license=('GPL')
url="http://reboli.nl/"
depends=(
	'xmms2>=0.7' \
	'libxpm' \
	)
source=( \
	"${url}programs/${pkgname}-${pkgver}.tar.bz2" \
	'01_gcc_warnings.patch' \
	'02_bogus_errmsg.patch' \
	'03_drmattdestruction.patch' \
	'04_drno.patch' \
)
md5sums=( \
	'5243b4f327a0efa9bdce8570f3b45f7a' \
	'f92753973747d382f9a5d791ea1b55b6' \
	'9399a1194b53b7f5d02d5180644c9f69' \
	'b881e2979ccd4aa0c11ab333bd8993f5' \
	'57eab1628de84a9f718e304c5b2f2f97' \
)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Reprocess automake files
	autoreconf -fi

#	./configure --prefix="${pkgdir}/usr"
	./configure --prefix="/usr"

	patch -p1 <"${srcdir}/01_gcc_warnings.patch"
	patch -p1 <"${srcdir}/02_bogus_errmsg.patch"
	patch -p1 <"${srcdir}/03_drmattdestruction.patch"
	patch -p1 <"${srcdir}/04_drno.patch"

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	mkdir -p "${pkgdir}/usr/bin/"
#	make install
	make prefix="${pkgdir}/usr" install
}
