# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>

pkgname=rtl8192ce
pkgver=2.6.0006.0321.2011
pkgrel=3
pkgdesc="Driver for Realtek 8192CE and 8188CE PCI wireless chipsets."
license=("GPL")
depends=('kernel-headers')
source=("http://jecxjo.sdf.org/aur/${pkgname}_linux_${pkgver}.tar.gz" 
				"kernel-3.0_support.patch")
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/"
install="${pkgname}.install"

build() {
	cd ${srcdir}/${pkgname}_linux_${pkgver}

	patch -p1 < ../kernel-3.0_support.patch

	make || return 1

	mkdir -p ${pkgdir}/lib/firmware
	cp -rf firmware/RTL8192CE ${pkgdir}/lib/firmware
	
	mkdir -p ${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/net/wireless/
	cp -f HAL/rtl8192/r8192ce_pci.ko ${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/net/wireless/

	mkdir -p ${pkgdir}/usr/share/rtl8192ce
	cp ${srcdir}/${pkgname}_linux_${pkgver}/{readme.txt,release_note,realtek/RadioPower.sh,realtek/wireless-rtl-ac-dc-power.sh,runwpa,wpa1.conf,wpa_supplicant-0.6.9.tar.gz} ${pkgdir}/usr/share/rtl8192ce
}

md5sums=('b8859faa5cdf21dc439fab2ea511501d'
         'fc3ec7b051c00cef4e5d3f5a19120ba5')

