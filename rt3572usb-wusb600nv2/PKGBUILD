# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Patches grabbed from https://build.opensuse.org/package/files?package=rt3572sta&project=driver%3Awireless
pkgname=rt3572usb-wusb600nv2
pkgver=2.5.0.0
pkgrel=16
__date=2011_0427
pkgdesc='Linksys WUSB600Nv2 wireless adapter driver'
arch=('i686' 'x86_64')
url='http://www.ralinktech.com/en/04_support/support.php?sn=501'
license=('GPL' 'GPL3' 'custom:ralink-firmware')
backup=('etc/Wireless/RT3572STA/RT3572STA.dat')
source=(http://mirror.thebasementserver.com/soft/ralink/linux/${__date}_RT3572_Linux_STA_v${pkgver}.DPO.bz2
        rt2870-firmware-update.pl
        rt3572build
        rt3572sta-${pkgver}-config.patch
        rt3572sta-${pkgver}-gcc-warnings-x86_64.patch
        rt3572sta-${pkgver}-WPA-mixed.patch
        rt3572sta-${pkgver}-convert-devicename-to-wlanX.patch
        rt3572sta-${pkgver}-remove-potential-conflicts-with-rt2870sta.patch
        rt3572sta-${pkgver}-extra_devices.patch
        rt3572sta-${pkgver}-reduce_debug_output.patch
        rt3572sta-${pkgver}-remove_date_time.patch
        rt3572sta.conf
        )

md5sums=('6a857c9d74987c7f3fa61b15ade179cc'
         '46318e134fe5505614d43c64d41ee276'
         '80652ee146a64cb9d7822ab36ea498d8'
         'da1d1e134b1f6f2169f878a26e7cbbdf'
         'b38c8301bdaec2ff70b400e35d6a8ebf'
         '00d84d51f25d8618785f39ab9e119bfe'
         'b67e200314b922ecb27d1a3c513a910e'
         '74b7b8aca71718e263d850c3b55b5110'
         '6f08105079d8b78bf19d0c7c83248c44'
         'e876bd43656ab1cbf3cd9a799249e1fe'
         '6527f2c308afc28e193233f04bcf98e6'
         'dd59211aa37f17a15bd182b9dace69c4')

depends=('linux-firmware' 'perl-libwww' 'perl-archive-zip' 'usbutils')
makedepends=('linux-headers' 'dos2unix')
install=rt3572usb-wusb600nv2.install

build() {

    cd ${__date}_RT3572_Linux_STA_v${pkgver}.DPO

    patch -Np0 -i ../rt3572sta-${pkgver}-config.patch
    [ "$CARCH" == "x86_64" ] && patch -Np0 -i ../rt3572sta-${pkgver}-gcc-warnings-x86_64.patch
    patch -Np0 -i ../rt3572sta-${pkgver}-WPA-mixed.patch
    patch -Np0 -i ../rt3572sta-${pkgver}-convert-devicename-to-wlanX.patch
    patch -Np0 -i ../rt3572sta-${pkgver}-remove-potential-conflicts-with-rt2870sta.patch
    patch -Np0 -i ../rt3572sta-${pkgver}-extra_devices.patch
    patch -Np0 -i ../rt3572sta-${pkgver}-reduce_debug_output.patch
    patch -Np0 -i ../rt3572sta-${pkgver}-remove_date_time.patch

    # clean up this mess of mixing RT2870STA with RT3572STA in documentation files
    mv RT2870STA.dat RT3572STA.dat
    mv RT2870STACard.dat RT3572STACard.dat
    sed -i 's/2870/3572/g' *STA*
    
    chmod 0644 RT3572* README* *.txt
    dos2unix RT3572* README* *.txt
    
    # as we change the default name of the interface from raX to wlanX,
    # change respective references in documentation, too
    sed -i 's|ra0|wlan0|g' *.txt README* *.dat
    sed -i 's|ra1|wlan1|g' *.txt README* *.dat
    sed -i 's|ra2|wlan2|g' *.txt README* *.dat
    
    ##
    ## If you're building for kernel 3.2.4 uncomment the sed lines
    ## below and BEFORE running makepkg type as root:
    ##
    ##  ln -sf /usr/src/linux-$(uname -r) /usr/src/linux
    ##
    ## after successfully building the package you can
    ## safely remove '/usr/src/linux' symlink
    ##
    #sed -i 's#LINUX_SRC = /lib/modules/$(shell uname -r)/build#LINUX_SRC = /usr/src/linux#' \
    #    Makefile
    export EXTRA_CFLAGS="-DVERSION=$pkgver"
    make
}

package() {
   ##rt3572build related
   install -D -m 744 rt3572build ${pkgdir}/usr/sbin/rt3572build
   install -D -m 644 ${__date}_RT3572_Linux_STA_v${pkgver}.DPO.bz2 ${pkgdir}/usr/share/rt3572sta/${__date}_RT3572_Linux_STA_v${pkgver}.DPO.bz2
   install -m 644  *.patch ${pkgdir}/usr/share/rt3572sta

   install -D -m 755 rt2870-firmware-update.pl ${pkgdir}/usr/bin/rt2870-firmware-update
   install -D -m 644 rt3572sta.conf ${pkgdir}/etc/modprobe.d/rt3572sta.conf
   cd ${__date}_RT3572_Linux_STA_v${pkgver}.DPO
   gzip -9 os/linux/rt3572sta.ko 
   install -D -m 644 os/linux/rt3572sta.ko.gz ${pkgdir}/usr/share/rt3572sta/rt3572sta.ko.gz
   install -D -m 644 RT3572STA.dat ${pkgdir}/etc/Wireless/RT3572STA/RT3572STA.dat

   ## docs &  license
   install -dm 0755 ${pkgdir}/usr/share/doc/${pkgname}
   install -m 0644 iwpriv_usage.txt README* RT3572STA* sta_ate_iwpriv_usage.txt ${pkgdir}/usr/share/doc/${pkgname}
   install -D -m 644 LICENSE\ ralink-firmware.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.ralink-firmware.txt
}

