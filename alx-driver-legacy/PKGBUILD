# Mantainer: Ivan de Jesús Pompa García <ivan.pompa@gmx.com>
# Contributor: kyak <bas@bmail.ru>

pkgname=('alx-driver-legacy')
_vname='2012-10-03'
_dkmsname='alx'
pkgver=20121003
pkgrel=1
pkgdesc='Atheros alx Linux ethernet device driver for legacy kernels < 3.7'
arch=('i686' 'x86_64')
url='http://linuxwireless.org/'
license=('custom')
depends=('dkms')
makedepends=('linux-headers<3.7')
options=('!strip')
conflicts=('dkms-alx')
provides=('dkms-alx')
install=alx-driver-legacy.install
source=(
	http://linuxwireless.org/download/compat-wireless-2.6/compat-wireless-${_vname}-pc.tar.bz2
	dkms.conf
)

md5sums=(
	'7d541af2ae06eeaaadaba5b4fbcbfb13'
	'09d23a9e80275bb2207721238b24cc3d'
)

build() {
	cd ${srcdir}/compat-wireless-${_vname}-pc
	rm -rf drivers/net/wireless
	./scripts/driver-select alx

	mkdir -p ${pkgdir}/usr/src/${_dkmsname}-${pkgver}
    cp -RL ${srcdir}/compat-wireless-${_vname}-pc/* ${pkgdir}/usr/src/${_dkmsname}-${pkgver}
    cp -RL ${srcdir}/compat-wireless-${_vname}-pc/.compat* ${pkgdir}/usr/src/${_dkmsname}-${pkgver}
    cp -RL ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_dkmsname}-${pkgver}
}
