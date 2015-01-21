# $Id: PKGBUILD 218290 2014-07-29 10:12:07Z lcarlier $
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-smsc
pkgver=1.0.2.1
pkgrel=20111206
pkgdesc="An X driver for SMSC UFX6000/UFX7000 devices."
arch=('x86_64' 'i686')
license=('custom')
url="http://www.smsc.com/support"
depends=('libusb')
groups=('xorg-drivers' 'xorg')
source=("http://ww1.microchip.com/downloads/en//softwarelibrary/obj-ufxx000-xlinux/linux_xorg_${pkgver}_${pkgrel}.tar.gz")
md5sums=('8afc000c2b38c8180f734a0490899572')

build() {
	cd ${srcdir}
	if [ "$CARCH" = "i686" ]; then
		ar vx linux_xorg_${pkgver}_${pkgrel}/xf86-video-smsc_${pkgver}-${pkgrel}_i386.deb
	elif [ "$CARCH" = "x86_64" ]; then
		ar vx linux_xorg_${pkgver}_${pkgrel}/xf86-video-smsc_${pkgver}-${pkgrel}_amd64.deb
	fi
	tar zxvf data.tar.gz
}

package() {
	cd ${pkgdir}

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 ${srcdir}/usr/bin/* "${pkgdir}/usr/bin/"

	install -dm755 "${pkgdir}/usr/lib/xorg/modules/drivers"
	install -Dm644 ${srcdir}/usr/lib/libsmscge.so.1.0.1 "${pkgdir}/usr/lib/"
	install -Dm644 ${srcdir}/usr/lib/xorg/modules/drivers/smsc_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers"


	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 ${srcdir}/usr/share/doc/${pkgname}/* "${pkgdir}/usr/share/doc/${pkgname}/"

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 ${srcdir}/usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/"
}
