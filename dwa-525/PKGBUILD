# Contributor: Stas Bourakov sbourakov(at)gmail.com
pkgname=dwa-525
pkgver=2.4.1.1
pkgrel=1
pkgdesc="Driver for Dlink DWA-525, and other RT3060/RT3062/RT3562/RT3592-based chipset wireless cards"
arch=('i686' 'x86_64')
url="http://www.ralinktech.com"
depends=('linux-headers')
license='GPL'
install='install.rt3060'
source=(ralink_bl.conf)

build() {
#get
if [ -f DPO_RT3562_3592_3062_LinuxSTA_V2.4.1.1_20101217.tgz ] ; 
then 
echo File already downloaded!;
else
curl -fJOL -d 'sn=5019&uname=auruser&email=aur@aur.aur' "http://www.ralinktech.com/en/04_support/dl.php" && tar -zxvf DPO_RT3562_3592_3062_LinuxSTA_V2.4.1.1_20101217.tgz; 
fi

    cd "${srcdir}"/DPO_RT3562_3592_3062_LinuxSTA_V2.4.1.1_20101217

    sed "s#HAS_WPA_SUPPLICANT=n#HAS_WPA_SUPPLICANT=y#" -i os/linux/config.mk
    sed "s#HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=n#HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=y#" -i os/linux/config.mk
    #removing spam from kernel logs
    sed "s#WFLAGS += -DCONFIG_STA_SUPPORT -DDBG#WFLAGS += -DCONFIG_STA_SUPPORT#" -i os/linux/config.mk
    make
}
package() {
    cd "${srcdir}"/DPO_RT3562_3592_3062_LinuxSTA_V2.4.1.1_20101217

    install -D -m755 os/linux/rt3562sta.ko "${pkgdir}"/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rt2x00/rt3562sta.ko
    install -D -m644 RT2860STA.dat "${pkgdir}"/etc/Wireless/RT2860STA/RT2860STA.dat
    install -D -m644 RT2860STACard.dat "${pkgdir}"/etc/Wireless/RT2860STA/RT2860STACard.dat
    install -D -m644 "${srcdir}"/ralink_bl.conf "${pkgdir}"/etc/modprobe.d/ralink_bl.conf
}
md5sums=('4bcd6af6d52a97da8574a9850a96dc1f')
