# Mantainer: Ivan de Jesús Pompa García <ivan.pompa@gmx.com>

pkgname=('alx-driver')
_vname='2012-10-03'
_dkmsname='alx'
pkgver=20121003
pkgrel=2
epoch=1
pkgdesc='Atheros alx Linux ethernet device driver'
arch=('i686' 'x86_64')
url='http://linuxwireless.org/'
license=('custom')
depends=('dkms')
makedepends=('linux-headers')
options=('!strip')
conflicts=('dkms-alx')
provides=('dkms-alx')
install=alx-driver.install
source=(
	http://linuxwireless.org/download/compat-wireless-2.6/compat-wireless-${_vname}-pc.tar.bz2
	dkms.conf
)

md5sums=(
	'7d541af2ae06eeaaadaba5b4fbcbfb13'
	'7ae5e105736dbd78d1cdd543373c766b'
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
