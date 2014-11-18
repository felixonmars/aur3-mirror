# Maintainer:  Michael Duell <michael.duell@rub.de>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg-modern
_pkgname=gnupg
pkgver=2.1.0
pkgrel=2
pkgdesc='GnuPG modern (2.1) is the brand new version with enhanced features like support for Elliptic Curve Cryptography. It will eventually replace the current stable (2.0)'
url='http://www.gnupg.org/'
license=('GPL')
arch=('i686' 'x86_64')
optdepends=('curl: gpg2keys_curl'
            'libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon')
makedepends=('curl' 'libldap' 'libusb-compat')
depends=('npth' 'libgpg-error' 'libgcrypt' 'libksba' 'libassuan'
         'pinentry' 'bzip2' 'readline')
source=('check.patch' "ftp://ftp.gnupg.org/gcrypt/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"{,.sig})

install=install

conflicts=('dirmngr' 'gnupg2' 'gnupg')
provides=('dirmngr' "gnupg2=${pkgver}" "gnupg=${pkgver}")
replaces=('dirmngr')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 -i ../check.patch
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/gnupg \
		--enable-maintainer-mode \
		--enable-standard-socket \
		--enable-symcryptrun \
		--enable-gpgtar \

	make
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
    make check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	ln -s gpg2 "${pkgdir}"/usr/bin/gpg
	ln -s gpgv2 "${pkgdir}"/usr/bin/gpgv
	ln -s gpg2.1.gz "${pkgdir}"/usr/share/man/man1/gpg.1.gz
	rm "${pkgdir}/usr/share/gnupg/com-certs.pem" # FS#33059
}

sha384sums=('f2d59561b04e8d9998854592e1f6b5e7c7a9cc7575ce701ef57d52ed4cac35cc5aa54390e86ffa9b27f573fc0bb3037d'
            '882a1fe5a2a49cf33a9fa555bc7f247436492a5fb06ab3b089b568b05a9a5cbc029d130a15baeee6e81c7ce346fee640'
            'SKIP')
