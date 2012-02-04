# Maintainer : Keshav P R <(skodabenz) (aatt) (rocketmail) (ddoott) (ccoomm)>

__pkgname="fdisk"
_pkgname="gnu-${__pkgname}"
pkgname="${_pkgname}"

pkgver="1.3.0a"
pkgrel=1
pkgdesc="GNU clone of util-linux fdisk and cfdisk"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/fdisk/"
license=('GPL')
makedepends=()
depends=('parted' 'ncurses')
optdepends=()
install="${pkgname}.install"
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("ftp://ftp.gnu.org/gnu/fdisk/fdisk-${pkgver}.tar.bz2"
		"ftp://ftp.gnu.org/gnu/fdisk/fdisk-${pkgver}.tar.bz2.sig"
		"https://bitbucket.org/gtrentalancia/fdisk-1.2.5/downloads/fdisk-1.2.5-update-sys-types.patch")

sha256sums=('c788ebd0f58aa13891774fcd561349e762e3750d0d144c1a0cf738600add5fbc'
            'd6ee88c2ad4a5d016d925938e26f74af5c04b6282f7ab5a539c1420d77d56510'
            'bef342deb56bc7c5e1ceb6b300c5e44e84fecf32a38f8150b5b123c4b3533959')

build() {
	
	cd "${srcdir}/${__pkgname}-${pkgver}/"
	
	# patch -Np1 -i "${srcdir}/fdisk-1.2.5-PED_ASSERT-remove-action-argument.patch"
	# patch -Np1 -i "${srcdir}/fdisk-1.2.5-update-sys-types.patch"
	
	mkdir -p "${srcdir}/${__pkgname}-${pkgver}/BUILD"
	cd "${srcdir}/${__pkgname}-${pkgver}/BUILD"
	
	CFLAGS="" ../configure --with-gnu-ext \
							--prefix=/usr \
							--bindir=/bin \
							--sbindir=/sbin \
							--mandir=/usr/share/man \
							--infodir=/usr/share/info \
							--sysconfdir=/etc
	echo
	
	CFLAGS="" make
	echo
	
}

package() {
	
	cd "${srcdir}/${__pkgname}-${pkgver}/BUILD"
	
	make DESTDIR="${pkgdir}" install
	echo
	
	install -D -m0755 "${pkgdir}/sbin/fdisk" "${pkgdir}/sbin/gnu-fdisk"
	install -D -m0755 "${pkgdir}/sbin/cfdisk" "${pkgdir}/sbin/gnu-cfdisk"
	
	cd "${pkgdir}/sbin/"
	
	rm -f gfdisk
	rm -f lfdisk
	
	ln -s gnu-fdisk gfdisk
	ln -s gnu-fdisk lfdisk
	
	cd "${srcdir}/${__pkgname}-${pkgver}/BUILD"
	
	install -D -m0644 "${pkgdir}/usr/share/info/fdisk.info" "${pkgdir}/usr/share/info/gnu-fdisk.info"
	install -D -m0644 "${pkgdir}/usr/share/info/cfdisk.info" "${pkgdir}/usr/share/info/gnu-cfdisk.info"
	
	install -D -m0644 "${pkgdir}/usr/share/man/man8/fdisk.8" "${pkgdir}/usr/share/man/man8/gnu-fdisk.8"
	install -D -m0644 "${pkgdir}/usr/share/man/man8/cfdisk.8" "${pkgdir}/usr/share/man/man8/gnu-cfdisk.8"
	
	rm -f "${pkgdir}/sbin/fdisk"
	rm -f "${pkgdir}/sbin/cfdisk"
	
	rm -f "${pkgdir}/usr/share/info/fdisk.info"
	rm -f "${pkgdir}/usr/share/info/cfdisk.info"
	
	rm -f "${pkgdir}/usr/share/man/man8/fdisk.8"
	rm -f "${pkgdir}/usr/share/man/man8/cfdisk.8"
	
}
