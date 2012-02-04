# Contributor: Josh Rickmar <joshua.rickmar@gmail.com>
# Contributor: Joshua Gonzales <jgonzales6@ucmerced.edu>
# Maintainer: Aliaksiej Artamonaŭ <aliaksiej.artamonau@gmail.com>

pkgname=lejos_nxj
pkgver=0.9.0
_pkgver=0_9_0beta
pkgrel=1
pkgdesc="Tools for programming the Lego NXT brick in Java"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'APACHE')
url="http://lejos.sourceforge.net/"
depends=('java-environment' 'java-runtime'
         'bluez' 'libusb'
         'java-bluecove' 'java-commons-cli' 'java-bcel')
makedepends=('apache-ant')
source=(http://downloads.sourceforge.net/sourceforge/lejos/lejos_NXJ_${_pkgver}.tar.gz
        lejos_nxj_vars
        70-lego.rules
        nxj
        nxjbrowse
        nxjc
        nxjconsole
        nxjconsoleviewer
        nxjcontrol
        nxjdataviewer
        nxjdebugtool
        nxjflash
        nxjflashg
        nxjimage
        nxjlink
        nxjmonitor
        nxjpc
        nxjpcc
        nxjsocketproxy
        nxjupload)

md5sums=('62dbb448296031df4bd991a993e868aa'
         '108b13aa7b55957c29165e59c7d07297'
         '7d5aa5e40f00ff441c83c8377c471dba'
         'b18a05370a34f9a862d9ec795240c211'
         '5898396c73d687d9ec096cf91bac8f95'
         'ae0eaf3451a3dbec9fd83d2d0c4a8d7a'
         '4c463fd1df413f9628f0a27b7dcec47f'
         'f2f6c83db98b9e6f1772c0c827fab5b3'
         '65ac2a909d1c1f8b1620eb4cfba29f8c'
         'fb8e93d442d61c8100d26bcb26750dd8'
         '3abdbdfb59177a98d14b28fd193f9867'
         'faf66948d474be921b36337fb5f61dfe'
         '6e9d5eb13847cc89e4d7909d2dd6d5a5'
         '77e3c64bf3d3cb8f603c0b7d0b74314f'
         '5ef682499913bfd0f4f4d36f654da35e'
         'b65e9f5ff700238be5e967c836da9ac3'
         '798dfd9af75b067b6a996e5c9297948e'
         '9fe380d49558b6aa5881d2879544cad7'
         '90afaac1da93323de3ec3f5f3dd6b030'
         '851dee70020900046aa81e63005d5293')

install=${pkgname}.install

build() {
    local ANT_BIN="/usr/share/java/apache-ant/bin"
    local ANT=${ANT_BIN}/ant

    cd ${startdir}/src/lejos_nxj/build
    ${ANT} || return 1
    cd ..

    install -d -m755 ${pkgdir}/usr/share/java/lejos_nxj || return 1
    install -m644 -t ${pkgdir}/usr/share/java/lejos_nxj \
                     lib/{nxt,pc}/*.jar || return 1

    install -d -m755 ${pkgdir}/usr/share/java/lejos_nxj/native || return 1
    install -m755 -t ${pkgdir}/usr/share/java/lejos_nxj/native \
                     lib/pc/native/linux/${CARCH}/*.so || return 1

    install -d -m755 ${pkgdir}/usr/share/lejos_nxj/bin || return 1
    install -m644 -t ${pkgdir}/usr/share/lejos_nxj/bin \
                     bin/*.{bin,nxd} || return 1
    install -m644 -t ${pkgdir}/usr/share/lejos_nxj \
                     ${srcdir}/lejos_nxj_vars || return 1

    install -d -m755 ${pkgdir}/usr/bin || return 1
    cd ${srcdir}
    install -m 755 -t ${pkgdir}/usr/bin \
                      ${source[*]:3} || return 1

    install -d -m755 ${pkgdir}/etc/udev/rules.d || return 1
    install -m644 -t ${pkgdir}/etc/udev/rules.d \
                     ${srcdir}/70-lego.rules || return 1
}
