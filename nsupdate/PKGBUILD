# Contributor: Alex Ignatov <lexszero@gmail.com>

pkgname=nsupdate

# Use a period and not a hyphen before the patch level for proper versioning.
pkgver=9.9.1.P2
_pkgver=9.9.1-P2
pkgrel=1

pkgdesc='nsupdate tool, moved away from dnstools package'
url='http://www.isc.org/software/bind/'
license=('custom:ISC')
arch=('i686' 'x86_64')
options=('!makeflags')
depends=('openssl' 'krb5' 'idnkit' 'dnssec-anchors')
source=("http://ftp.isc.org/isc/bind9/${_pkgver}/bind-${_pkgver}.tar.gz"
        'remove-shit.patch' 'fix-nsupdate-segfault.patch')

sha1sums=('449b12c32682b5bef64c7b53cd0fc0c6b731c8a7'
          'c4acc9db96547d947c81960d4ae1857471f8434a'
          '605f56113c7d2388b1da3ca5b5f8ebf7fd25f61e')

conflicts=('bind')

build() {
	cd "${srcdir}/bind-${_pkgver}"

	patch -p1 -i ../remove-shit.patch
	patch -p0 -i ../fix-nsupdate-segfault.patch
	export STD_CDEFINES='-DDIG_SIGCHASE'

	# hack to remove unused bloat from the binaries
	CFLAGS+=' -fdata-sections -ffunction-sections'
	LDFLAGS+=' -Wl,--gc-sections'

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--disable-static \
		--disable-linux-caps \
		--with-openssl \
		--with-idn \

	make
}

package() {
	cd "${srcdir}/bind-${_pkgver}"
	install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd bin; make DESTDIR="${pkgdir}" install
}
