# Maintainer: Padfoot <padfoot at exemail dot com dot au>

pkgname="xf86-input-egalax-linux3"
pkgver="2.3.1627"
pkgrel=1
pkgdesc="eGalaxTouch touchscreen driver"
url="http://home.eeti.com.tw/web20/eGalaxTouchDriver/linuxDriver.htm"
license=('custom:EULA')
arch=('i686' 'x86_64')

_architect='32'
[ "$CARCH" = "x86_64" ] && _architect='64'

source=("eGTouch_v${pkgver}.L-x.tar.gz::http://home.eeti.com.tw/web20/drivers/touch_driver/Linux/20120502/eGTouch_v${pkgver}.L-x.tar.gz"
    "eGalaxConfig.desktop"
    "eGTouchD")
install='xf86-input-egalax-linux3.install'

backup=(etc/eGTouchL.ini)

depends=('linux>=3.0' 'libpng12' 'gksu' 'alsa-lib' 'hicolor-icon-theme')
makedepends=('gtk-update-icon-cache')
provides=('eGTouchD')
conflicts=('egalax' 'touchkit' 'eGTouchd')
groups=('xorg-input-drivers')

md5sums=('abbc516ec96605f88ed48b240bc7ef51'
         '0ee99c83fd74bdb8357427eae9b2dc7d'
         '50414a9d86692c88ee65b43db55d41ec')
         
package() {
    mkdir -p \
        "$pkgdir/etc/X11/xorg.conf.d" \
        "$pkgdir/etc/rc.d" \
        "$pkgdir/usr/share/eGTouch/sample" \
        "$pkgdir/usr/share/applications" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps" \
        "$pkgdir/usr/share/licenses/$pkgname" \
        "$pkgdir/usr/bin" || return 1

    cd $srcdir/eGTouch_v${pkgver}.L-x/eGTouch${_architect}/eGTouch${_architect}withX

    install -D -m755 eGTouchU $pkgdir/usr/bin
    install -D -m755 eGTouchD $pkgdir/usr/bin
    install -D -m755 eCalib $pkgdir/usr/bin
    install -D -m755 eGTouchL.ini $pkgdir/etc
    
    cd ../../Rule
    
    install -D -m644 52-egalax-virtual.conf $pkgdir/etc/X11/xorg.conf.d
    install -D -m644 eGTouchU.png $pkgdir/usr/share/icons/hicolor/scalable/apps

    cd ../Patent_Declaration

    install -D -m644 eula.pdf $pkgdir/usr/share/licenses/$pkgname
    install -D -m644 "EETI_Declaration_and_Disclaimer.pdf" $pkgdir/usr/share/licenses/$pkgname

    cd ../Guide
    
    install -D -m644 "EETI_eGTouch_Utility_Guide_for Linux_v1.02.pdf" $pkgdir/usr/share/eGTouch
    install -D -m644 "EETI_eGTouch_Linux_Programming_Guide_v2.3.pdf" $pkgdir/usr/share/eGTouch

    install -D -m644 GetEvent.c $pkgdir/usr/share/eGTouch/sample


    cd ../../../

    install -D -m755 eGalaxConfig.desktop $pkgdir/usr/share/applications
    install -D -m755 eGTouchD $pkgdir/etc/rc.d
}