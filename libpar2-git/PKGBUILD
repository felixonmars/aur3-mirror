# Maintainer: beta992 <beta992@gmail.com>

pkgname=libpar2-git
_gitname=libpar2
pkgver=0.4
pkgrel=3
pkgdesc="Parity checking library (debian-version)"
arch=('i686' 'x86_64')
url="http://anonscm.debian.org/gitweb/?p=collab-maint/libpar2.git;a=summary"
license=('GPL')
depends=('libsigc++2.0')
makedepends=('git' 'autoconf' 'automake' 'pkgconfig' 'patch')
conflicts=('libpar2')
provides=('libpar2')
source=(git://git.debian.org/collab-maint/libpar2.git
		libpar2-0.4-external-verification.patch)
sha256sums=('SKIP'
			'd920d9b3f2ff513c2b42bf8f096b951fdf3fed3f0f72683d46b72b1482b09ba1')

build() {
	cd ${srcdir}/${_gitname}

	patch < ${srcdir}/libpar2-0.4-external-verification.patch

	./configure --prefix=/usr

	make
}

package() {
	cd ${srcdir}/${_gitname}

	make DESTDIR=${pkgdir} install

	# Docs
	install -d ${pkgdir}/usr/share/doc/${pkgname}
	install -m644 -t ${pkgdir}/usr/share/doc/${pkgname}/ AUTHORS PORTING README ROADMAP
}