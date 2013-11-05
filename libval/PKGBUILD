
# Maintainer: Luca Fulchir <luca@fulchir.it>

pkgname=libval
realpkgname=dnssec-tools
pkgver=2.0
pkgrel=4
pkgdesc="libval DNSSEC libarary from dnssec-tools"
arch=('i686' 'x86_64')
url="http://www.dnssec-tools.org"
license=('BSD')
conflicts=('dnssec-tools')
depends=('libsres')
source=(http://www.dnssec-tools.org/download/${realpkgname}-${pkgver}.tar.gz)
md5sums=('b738664499c150cf81a1c4307ff07e0f')
sha1sums=('4cae015ba8fe6aba66131cd9f0ae0c8dd4524f01')
sha256sums=('7fd5d483c7a4b25277f17d9010b8de79a21948884368e6d870bec0194d007445')


build() {
	cd "$srcdir/${realpkgname}-${pkgver}"
	./configure	--exec_prefix=/usr \
			--prefix=/usr \
			--mandir=/usr/share/man \
			--sysconfdir=/etc \
			--with-ipv6 \
			--with-nsec3 \
			--with-dlv \
			--disable-bind-checks
	cd "$srcdir/${realpkgname}-${pkgver}/validator/${pkgname}"
	make DESTDIR="${pkgdir}"
	cd "$srcdir/${realpkgname}-${pkgver}/validator/doc"
	make DESTDIR="${pkgdir}"
}

package() {
	cd "$srcdir/${realpkgname}-${pkgver}/validator/${pkgname}/"
	make install DESTDIR="${pkgdir}"
	cd "$srcdir/${realpkgname}-${pkgver}/validator/doc"
	make install DESTDIR="${pkgdir}"

	# keep *only* the libval documentation
	cd ${pkgdir}/usr/share/man/
	rm -rf man1 man5 man8
	cd man3
	rm -f Net* libsres* libval_shim*
	
}


