# Contributor: slubman <slubman.dndd@laposte.net>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>

pkgname=afpfs-ng
pkgver=0.8.1
pkgrel=2
pkgdesc="A client for the Apple Filing Protocol (AFP)"
license=('GPL')
depends=('gmp' 'fuse' 'libgcrypt')
arch=('i686' 'x86_64')
source=(
	"http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	'fix_afpfs-ng_includes.patch'
	'01-gcrypt.patch'
	'02-pointer.patch'
	'10-fix-errno.patch'
)
sha256sums=(
	'688560de1cde57ab8d9e0ef7dc6436dbf0267fe8884f9014e50ff92b297b01a8'
	'627d94ab3c1cbc002b18839f514c6fa980b0a25dfc21e8761b389fcd39f32755'
	'18dc77b064fc02c229e0cfa071a7e31cde6d0243671ebde2f561ebdf09dc38bb'
	'8537b086c496e776be2a6757325717cb15dee6dcf2aedccebed6b4b2332d3dc1'
	'0e1c0c0e3a9ff6e55ccbbbc1b4de630c874ff058e2ea94360b7d90e650d04811'
)
url="http://alexthepuffin.googlepages.com/"

build() {
	cd ${pkgname}-${pkgver}
	# apply patches
	msg2 'fix_afpfs-ng_includes.patch'
	patch -Np1 -i ${srcdir}/fix_afpfs-ng_includes.patch
	msg2 '01-gcrypt.patch'
	patch -Np1 -i ${srcdir}/01-gcrypt.patch
	msg2 '02-pointer.patch'
	patch -Np1 -i ${srcdir}/02-pointer.patch
	msg2 '10-fix-errno.patch'
	patch -Np1 -i ${srcdir}/10-fix-errno.patch

	./configure --prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=$pkgdir install

	# install headers
	cd include
	for header in afpfs-ng/*.h; do
		install -Dm644 ${header} ${pkgdir}/usr/include/${header}
	done
}
