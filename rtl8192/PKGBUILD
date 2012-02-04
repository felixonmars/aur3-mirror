# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>

pkgname=rtl8192
pkgver=0005.1230.2011
pkgrel=2
pkgdesc="Driver for Realtek 8192CE/DE/SE PCI wireless chipsets."
license=("GPL")
depends=('linux-headers')
source=("ftp://WebUser:Lc9FuH5r@209.222.7.36/cn/wlan/92ce_se_de_linux_mac80211_0005.1230.2011.tar.gz")
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/"
install="${pkgname}.install"
md5sums=('f7d166274151276a7f7035813a5d5336')

build() {
	cd "${srcdir}"/rtl_92ce_92se_92de_linux_mac80211_${pkgver}
	make
}

package() {
	cd "${srcdir}"/rtl_92ce_92se_92de_linux_mac80211_${pkgver}
	mkdir -p "${pkgdir}"/lib/firmware
	cp -rf firmware/rtlwifi "${pkgdir}"/lib/firmware/rtlwifi
	mkdir -p "${pkgdir}"/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rtlwifi/rtl8192{c,d,s}e
	cp -f rtl8192ce/rtl8192ce.ko "${pkgdir}"/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rtlwifi/rtl8192ce
	cp -f rtl8192de/rtl8192de.ko "${pkgdir}"/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rtlwifi/rtl8192de
	cp -f rtl8192se/rtl8192se.ko "${pkgdir}"/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rtlwifi/rtl8192se
	cp -f rtlwifi.ko "${pkgdir}"/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rtlwifi
    find "${pkgdir}"/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rtlwifi -name '*.ko' -exec gzip {} \;
}
