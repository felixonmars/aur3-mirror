# Contributor : dz0ny <dz0ny at ubuntu dot si>

pkgname=firmware-wifi-brcm80211
pkgver=20140206
pkgrel=3
pkgdesc="This package contains the binary firmware for wireless network cards with the Broadcom BCM4313, BCM43224 or BCM43225 chip, supported by the brcm80211 driver."
arch=('armv7h')
url="https://github.com/OpenBricks/openbricks/tree/master/packages/firmware-wifi-brcm80211"
license=('non-free')

build() {
   mkdir -p ${pkgdir}/usr/lib/firmware/brcm
   curl https://raw.githubusercontent.com/OpenBricks/openbricks/master/packages/firmware-wifi-brcm80211/config/bcm4329_nvram.txt > brcmfmac4329-sdio.txt
   curl https://raw.githubusercontent.com/OpenBricks/openbricks/master/packages/firmware-wifi-brcm80211/config/bcm4330_nvram.txt > brcmfmac4330-sdio.txt
   install -m644 brcmfmac4329-sdio.txt ${pkgdir}/usr/lib/firmware/brcm
   install -m644 brcmfmac4330-sdio.txt ${pkgdir}/usr/lib/firmware/brcm
}

 