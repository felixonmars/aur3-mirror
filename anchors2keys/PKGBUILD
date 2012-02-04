# Contributor:	Thomas Mudrunka <harvie@@email..cz>
# Maintainer: 	Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=anchors2keys
pkgver=2010.03.31
pkgrel=1
pkgdesc="Tool from ITAR.IANA. Takes a set of DS records, and fetches the DNSKEYs that match. Used for DNSSEC software that only accepts keys as trust anchors, rather than DS records."
url="https://itar.iana.org/instructions/"
license="BSD"
arch=(any)
depends=(python python-dnspython)
source=(https://itar.iana.org/_misc/${pkgname})
md5sums=('b57c5683bbb863a3382303f4ef61a689')

build() {
	mkdir -p "${pkgdir}/usr/bin/"
	cp "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/"
	chmod -R 755 "${pkgdir}"
}
