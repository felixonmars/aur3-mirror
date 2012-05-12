# Maintainer: Jaroslav Martinek <jamar@jamar.org>

pkgname=dvb-usb-it9135
pkgver=0.1
pkgrel=1
pkgdesc="Firmware for ITE IT9135 chip version 1 & 2 based USB DVB-T sticks"
arch=('any')
url="http://www.ite.com.tw"
license=('unknown')
makedepends=('unzip')
conflicts=('')
source=(http://www.ite.com.tw/uploads/firmware/v3.6.0.0/dvb-usb-it9135.zip)
md5sums=(04a054b357eec52efb3bc02156bcc11e)

build() {
    install -d $pkgdir/usr/lib/firmware
    unzip -o $srcdir/dvb-usb-it9135.zip
    dd if=$srcdir/dvb-usb-it9135.fw ibs=1 skip=64 count=8128 of=$srcdir/dvb-usb-it9135-01.fw
    dd if=$srcdir/dvb-usb-it9135.fw ibs=1 skip=12866 count=5817 of=$srcdir/dvb-usb-it9135-02.fw
    rm $srcdir/dvb-usb-it9135.fw
    install -D -m644 $srcdir/*.fw ${pkgdir}/usr/lib/firmware
}

