# Contributor: Sungmin jo <linukizx@gmail.com>
pkgname=dvb-usb-bluebird-fw
pkgver=0.1
pkgrel=1
pkgdesc="Firmware for the Divico DVB-USB."
arch=('i686' 'x86_64')
url="http://www.linuxtv.org/downloads/firmware/"
license=('unknown')
makedepends=('linuxtv-dvb-apps')
source=("http://www.linuxtv.org/downloads/firmware/dvb-usb-bluebird-01.fw")
md5sums=('658397CB9EBA9101AF9031302671F49D')

build() {
  cd "$srcdir"

  install -D dvb-usb-bluebird-01.fw $pkgdir/lib/firmware/dvb-usb-bluebird-01.fw
}