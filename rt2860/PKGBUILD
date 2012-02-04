# Maintainter: <jakob.gruber@gmail.com>
# Contributor: Marius Dransfeld <marius.dransfeld@gmail.com>

pkgname=rt2860
pkgver=2.4.0.0
pkgrel=2
pkgdesc="Drivers for rt2860/2890 chipset wireless cards"
arch=('i686' 'x86_64')
url="http://www.mediatek.com/en/Products/support.php?sn=501"
depends=('linux')
makedepends=('linux-headers')
license='GPL'
install=install.rt2860

pkgprefix='2010_07_16_'

source=("http://dl.dropbox.com/u/169548/${pkgprefix}RT2860_Linux_STA_v${pkgver}.tar.bz2")
md5sums=('b2623a02a006e1b18eea1b9ab58495f0')

build() {

    cd "${srcdir}"/${pkgprefix}RT2860_Linux_STA_v${pkgver}

    sed "s#HAS_WPA_SUPPLICANT=n#HAS_WPA_SUPPLICANT=y#" -i os/linux/config.mk
    sed "s#HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=n#HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=y#" -i os/linux/config.mk

    make
}
package() {
    cd "${srcdir}"/${pkgprefix}RT2860_Linux_STA_v${pkgver}

    install -D -m755 os/linux/rt2860sta.ko "${pkgdir}"/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rt2860sta.ko
    install -D -m644 RT2860STA.dat "${pkgdir}"/etc/Wireless/RT2860STA/RT2860STA.dat
    install -D -m644 RT2860STACard.dat "${pkgdir}"/etc/Wireless/RT2860STA/RT2860STACard.dat

}
