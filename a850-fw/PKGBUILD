# Contributor: maddien <madstitz@googlemail.com>
pkgname=a850-fw
pkgver=1.0
pkgrel=2
pkgdesc="Firmware for AVerMedia AverTV Volar Black HD DVB-T USB 2.0 (A850)"
arch=(any)
url="http://linuxtv.org"
license=('GPL')
source=(http://palosaari.fi/linux/v4l-dvb/firmware/af9015/5.1.0.0/dvb-usb-af9015.fw)
md5sums=('5c2da8881b8be5161c7db8ef94711cf5')
noextract=(dvb-usb-af9015.fw)

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/lib/firmware
  cp dvb-usb-af9015.fw $pkgdir/usr/lib/firmware
}
