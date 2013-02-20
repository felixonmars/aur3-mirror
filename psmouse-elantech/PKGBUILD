# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=psmouse-elantech
pkgver=v6
pkgrel=8
pkgdesc="psmouse kernel module with support for elantech with multitouch"
url="http://bugs.edge.launchpad.net/ubuntu/+source/xserver-xorg-video-intel/+bug/681904"
license=("GPL")
depends=('linux-headers' 'dkms')
arch=('any')
install=psmouse-elantech.install
source=("http://planet76.com/drivers/elantech/psmouse-elantech-${pkgver}.tar.bz2"
	'synaptics_api.patch')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/

	# fix api, broke in linux 3.7.x
	patch -Np1 < ${srcdir}/synaptics_api.patch

	# we disable support for OLPC... this does not compile
	sed -i '/CONFIG_MOUSE_PS2_OLPC/s|^|//|' src/Makefile
	sed -i '/#ifdef CONFIG_MOUSE_PS2_OLPC/,/#endif/d' src/psmouse-base.c
	sed -i 's/src/./' dkms.conf
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/

	install -d -m0755 ${pkgdir}/var/lib/dkms/psmouse/elantech-${pkgver}
	mv src ${pkgdir}/var/lib/dkms/psmouse/elantech-${pkgver}/source
	install -D -m644 dkms.conf ${pkgdir}/var/lib/dkms/psmouse/elantech-${pkgver}/source/dkms.conf
}

sha256sums=('a5796b71137224c824174668a97ab277fd508acc5153e9c35ebad11131388de0'
            '785d21b45e022ce91a4b9b37692f7384d4861ae86758f1105345a697cbae3a07')
