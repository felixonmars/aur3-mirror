# Mantainer: Ivan de Jesús Pompa García <ivan.pompa@gmx.com>
# Contributor: kyak <bas@bmail.ru>

pkgname=('dkms-alx')
_vname='3.9-rc4-2-su'
_dkmsname='alx'
pkgver='3.9'
pkgrel=9
epoch=3
pkgdesc='Atheros alx Linux ethernet device driver'
arch=('i686' 'x86_64')
url='http://linuxwireless.org/'
license=('custom')
depends=('dkms')
makedepends=('linux-headers>=3.7')
options=('!strip')
conflicts=('dkms-alx', 'alx-driver', 'alx-driver-legacy')
provides=('dkms-alx', 'alx-driver', 'alx-driver-legacy')
install=alx-driver.install
source=(
	http://www.kernel.org/pub/linux/kernel/projects/backports/stable/v3.9-rc4/compat-drivers-${_vname}.tar.bz2
	dkms.conf
	alx.sh
	ke2200.patch
)

sha256sums=(
	'f7e527d569ce03e454e466bdd51c0c8b3a054ac89c28011e075d18933631268c'
	'd33bb4568ab2efd49331d209a0bcd42999ae8570e9c240cd3332238f00d2620c'
	'797b1b61aa0bfdb5f7565fef70720f8c30e8c9d0bfd43effeae2b7f1078d2372'
	'024cda3a1ede0023e9203521d21366401bb9b8ccf8b5fceee8ee4bcf98d9a65f'
)

package() {
	mkdir -p ${pkgdir}/usr/lib/systemd/system-sleep
	cp -RL alx.sh ${pkgdir}/usr/lib/systemd/system-sleep
	chmod a+x ${pkgdir}/usr/lib/systemd/system-sleep/alx.sh

	cd ${srcdir}/compat-drivers-${_vname}
	rm -rf drivers/net/wireless
	./scripts/driver-select alx

	mkdir -p ${pkgdir}/usr/src/${_dkmsname}-${pkgver}
	cp -RL ${srcdir}/compat-drivers-${_vname}/* ${pkgdir}/usr/src/${_dkmsname}-${pkgver}
	cp -RL ${srcdir}/ke2200.patch ${pkgdir}
	cp -RL ${srcdir}/compat-drivers-${_vname}/.compat* ${pkgdir}/usr/src/${_dkmsname}-${pkgver}
	cp -RL ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_dkmsname}-${pkgver}

	cd ${pkgdir}
	patch -p0 < ke2200.patch 
}
