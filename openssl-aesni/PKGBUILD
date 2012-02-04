# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=openssl-aesni
pkgver=1.0.0.g
_pkgver=1.0.0g
pkgrel=1
pkgdesc='OpenSSL with backported AES-NI support'
url='http://rt.openssl.org/Ticket/Display.html?id=2065&user=guest&pass=guest'
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('perl')
optdepends=('ca-certificates')
backup=('etc/ssl/openssl.cnf')
source=("https://www.openssl.org/source/openssl-${_pkgver}.tar.gz"
        'fix-manpages.patch'
        'no-rpath.patch'
        'ca-dir.patch'
        'aesni.patch')
sha1sums=('2b517baada2338663c27314cb922f9755e73e07f'
          '163ec803f7430698b14cddbf1fcdab1d34bfbc10'
          'ed1f88f5dc6f47b4373d3ff03bcb12e85e54ebae'
          '41da8f565f69dc76b01a6d60b3bedd6ba527089b'
          '152832a03a73f952779f8532304c8ecdcaa38501')

provides=("openssl=${pkgver}")
conflicts=('openssl')

build() {
	cd "${srcdir}/openssl-${_pkgver}"

	[[ ${CARCH} = x86_64 ]] && _target=linux-x86_64 || _target=linux-elf

	patch -p1 -i ../fix-manpages.patch # http://www.linuxfromscratch.org/patches/downloads/openssl/
	patch -p0 -i ../no-rpath.patch # http://bugs.archlinux.org/task/14367
	patch -p0 -i ../ca-dir.patch # set ca dir to /etc/ssl by default
	patch -p1 -i ../aesni.patch # http://rt.openssl.org/Ticket/Display.html?id=2065&user=guest&pass=guest

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared zlib enable-md2 \
		"${_target}" \
		-Wa,--noexecstack "${CFLAGS}" "${LDFLAGS}"

	make depend
	make
}

check() {
	cd "${srcdir}/openssl-${_pkgver}"
	# revert or test fails due to missing write permissions in /etc/ssl
	patch -p0 -R -i ../ca-dir.patch
	make test
	patch -p0 -i ../ca-dir.patch
}

package() {
	cd "${srcdir}/openssl-${_pkgver}"
	make INSTALL_PREFIX="${pkgdir}" MANDIR=/usr/share/man install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
