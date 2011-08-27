# Contributor: Jared B. <nitro@legroom.net>

pkgname=lotus-notes-cae
pkgver=8.5
pkgrel=1
_pkgnum=C1SP5EN
_pkgorig=ibm_lotus_cae
pkgdesc='Lotus Notes messaging and collaboration suite - Composite Application Editor component'
arch=(i686)
license=('unknown')
url='http://www.ibm.com/software/lotus/products/notes/'
#install=openoffice.install
depends=('lotus-notes-base')
makedepends=('rpmextract')
source=(${_pkgnum}.tar)
md5sums=('19a68a6258071d58b2f14cc344a76d8a')

# This package must first be downloaded from IBM's Passport Advantage website:
# https://www-112.ibm.com/software/howtobuy/passportadvantage/paocustomer/passporthome.nsf/pao?OpenAgent&softdlmediaaccess

build() {
	# Unpack source packages
	cd ${pkgdir}
	rpmextract.sh ../src/${_pkgorig}-${pkgver}.i586.rpm

	# fix ownership and permissions
	chown root:root -R ${pkgdir}
}
