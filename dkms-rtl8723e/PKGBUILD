# Maintainer: blackleg <hectorespertpardo@gmail.com>


pkgname=dkms-rtl8723e
_pkgname=rtl8723e
pkgver=1
pkgrel=3
pkgdesc="Realteck kernel module for the rtl8723e."
arch=("i686" "x86_64")
url=https://github.com/tianon/linux-rtlwifi-8188ce
license=(unknown)
groups=(modules)
depends=("dkms")
provides=("rtl8723e")
source=("https://github.com/tianon/linux-rtlwifi-8188ce/archive/master.zip" "rtl8723e.install" "dkms.conf" "rtl8723e.patch")


md5sums=('beb040e518a5f00a4ded4e2b52e8a7db'
         '9b21bd0ae808e479a15e7b5782b76dc8'
         '11e32912023ffb528522092c10bfa217'
         '51a8432edfad42612a0d91e63c578327')


install=rtl8723e.install

package() {

	cd "${srcdir}"
	patch -p0 < rtl8723e.patch
	mkdir -p "$pkgdir/usr/src/${_pkgname}-${pkgver}"
	mkdir -p "$pkgdir/usr/src/${_pkgname}-${pkgver}/rtl8723e"
	install -p -m 755 dkms.conf "$pkgdir/usr/src/${_pkgname}-${pkgver}"

	cd "${srcdir}/linux-rtlwifi-8188ce-master"
	rm -rf compat
	rm -rf compat-*
	rm -rf firmware
	rm -rf rtl8192*
	install -p -m 755 ./rtl8723e/* "$pkgdir/usr/src/${_pkgname}-${pkgver}/rtl8723e"
	rm -rf rtl8723e
	install -p -m 755 * "$pkgdir/usr/src/${_pkgname}-${pkgver}"

	
	#find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
	
}
