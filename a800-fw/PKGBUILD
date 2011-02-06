# Contributor: Vamp898 <vamp898@web.de>
pkgname=a800-fw
pkgver=1.0
pkgrel=1
pkgdesc="Firmware for AVerMedia AverTV DVB-T USB 2.0 (A800)"
arch=(any)
url="http://linuxtv.org"
license=('GPL')
source=(http://www.linuxtv.org/downloads/firmware/dvb-usb-avertv-a800-02.fw)
noextract=(dvb-usb-avertv-a800-02.fw)

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/lib/firmware
  cp dvb-usb-avertv-a800-02.fw $pkgdir/lib/firmware
}
md5sums=('241366ca9d39017c9bb8404afb6c7531')
