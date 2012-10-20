pkgname=dkms-plusb-pl2501
_pkgname=plusb
pkgver=git
pkgrel=2
pkgdesc='DKMS-controlled plusb driver with a patch for PL-2501 USB Easy Trasfer Cables'
url='https://patchwork.kernel.org/patch/1227361/'
arch=('i686' 'x86_64')
license=('custom')
depends=('dkms')
makedepends=('wget' 'linux-headers')

source=('Makefile'
	'dkms.conf'
	'plusb.patch')
md5sums=('0ec82c41ed3da3890619a5a9540d807e'
	 '8508428d54694b42ca3df67aea3900a7'
	 '9fa61ce89bb6652f4d68b193c83cdbf2')

install=plusb-driver.install

build() {
	cd "${srcdir}"
	wget 'http://git.kernel.org/?p=linux/kernel/git/stable/linux-stable.git;a=blob_plain;f=drivers/net/usb/plusb.c;hb=HEAD' -O plusb.c
	patch -p0 < plusb.patch
}

package() {
	cd "${srcdir}"
	mkdir -p ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -L Makefile ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -L dkms.conf ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -L plusb.c ${pkgdir}/usr/src/${_pkgname}-${pkgver}
}
