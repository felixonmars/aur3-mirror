# Maintainer: Alex M <alex+aur@migame.org>

pkgname=libmowgli2
pkgver=2.0.0
pkgrel=1
pkgdesc='A useful collection of routines for programming. Performance and usability-oriented extensions to C.'
url='http://www.atheme.org/project/mowgli'
license=('custom:Atheme')
arch=('i686' 'x86_64')
depends=('glibc')
optdepends=('openssl: SSL support')
source=("http://atheme.org/downloads/libmowgli-${pkgver}.tar.gz")
sha256sums=('7c5a94082899d055fc9a02b94e2658b42616fdb98e58e9a71165c07b6f5cceba')
provides=('libmowgli2=2.0.0')

# libmowgli-2.0.0 is the true name/version, so use this to specify
# the gunzipped directory name
_xpkgnamever=libmowgli-${pkgver}

build() {
	cd "${srcdir}/${_xpkgnamever}"
    
    ./autogen.sh
	./configure --prefix=/usr

	make
}

package() {
	cd "${srcdir}/${_xpkgnamever}"

	make DESTDIR="${pkgdir}" install

	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

