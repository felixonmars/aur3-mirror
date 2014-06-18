#Maintainer: Thomas Matysik <thomas at matysik dot co dot nz>

pkgname=rr272x_1x-dkms
pkgver=1.5.1303250732
pkgrel=2
pkgdesc="Kernel module for Highpoint RocketRAID 272x SAS cards (DKMS version)"
url="http://www.highpoint-tech.com/USA_new/CS-PCI-E_2_0_x8_Configuration.html"
arch=('i686', 'x86_64')
license=('custom')
depends=('dkms')
provides=("rr272x_1x=${pkgver}")
conflicts=('rr272x_1x' 'rr272x_1x-lts')
install=${pkgname}.install
options=
_pkgname=rr272x_1x
source=('http://www.highpoint-tech.com/BIOS_Driver/rr272x_1x/linux_1.5/RR272x_1x-Linux-Src-v1.5-130325-0732.tar.gz'
	'0001-Fixes-for-kernel-3.10.patch'
	'0002-Remove-__DATE__-and-__TIME__-macros.patch'
	'dkms.conf')

md5sums=('4a5cf0f4ab5a8fc170ad69f3a3078eb6'
	 '81494f17362e9e87c843523869a39a3f'
	 '8efe355e725f966808a9549dcdf89590'
	 'c9f18df4dbcbb25f304595d6acd63ee6')

build() {
	cd ${srcdir}/rr272x_1x-linux-src-v1.5/
	patch -p1 <../0001-Fixes-for-kernel-3.10.patch
	patch -p1 <../0002-Remove-__DATE__-and-__TIME__-macros.patch
}

package() {
	install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
	cp -a "${srcdir}/rr272x_1x-linux-src-v1.5"/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
	install -m644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

	# Blacklist mvsas module
	install -dm755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist mvsas" >"${pkgdir}/usr/lib/modprobe.d/rr272x_1x.conf"

	# Install "license"
	install -D -m644 "${srcdir}/rr272x_1x-linux-src-v1.5/README" "${pkgdir}/usr/share/licenses/${pkgname}/README"
}
