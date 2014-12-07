# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg-quiet
_pkgname=gnupg
_patchversion=3
pkgver=2.1.0
pkgrel=6
pkgdesc='Complete and free implementation of the OpenPGP standard with silent signing'
url='http://www.gnupg.org/'
license=('GPL')
arch=('i686' 'x86_64')
optdepends=('libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon')
makedepends=('libldap' 'libusb-compat')
depends=('npth' 'libgpg-error' 'libgcrypt' 'libksba' 'libassuan'
         'pinentry' 'bzip2' 'readline')
source=("ftp://ftp.gnupg.org/gcrypt/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"{,.sig}
"https://github.com/graysky2/gnupg_quiet_sign/archive/v${_patchversion}.tar.gz"
'oid2str-overflow.patch'
'subpacket-off.patch'
'hash-ecdsa.patch'
'refresh-keys.patch')
sha256sums=('16a8c3f50a15bf37d2dfb1c5e4bb3ec533e1d0b6a4043ff3680a376a3ad4058b'
            'SKIP'
            '2adbeb2c1b44edd254b807c081e7743a4a8214972a56402d85a6ae2295157c4f'
            '96fe8e6604026c21a909882fa56f896019797b7d771e42320d8427ba995d61fe'
            '93c0e2ee40477f456a9e84ba4566372384f88ebb3be9ef8b024b5f627add5961'
            '4941548fc16d4cff5f1e2f07e2cf1b6559425ff0ae9f7ece24572bba709f3ef2'
            '43624c2149bcca9baec52bf61b5481d995bd3f6f0b9342767512821592796b8e')

install=install

conflicts=('dirmngr' 'gnupg2')
provides=('dirmngr' "gnupg2=${pkgver}" "gnupg=${pkgver}")
replaces=('dirmngr' 'gnupg2')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 -i "${srcdir}/gnupg-quiet-sign-$_patchversion/sign_quietly.patch"
	patch -p1 -i ../oid2str-overflow.patch
	patch -p1 -i ../subpacket-off.patch
	patch -p1 -i ../refresh-keys.patch
	patch -p1 -i ../hash-ecdsa.patch
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/gnupg \
		--enable-maintainer-mode \
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
