# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=ec168-firmware
pkgver=1
pkgrel=1
pkgdesc="usb dvb stick ec-168 firmware"
arch=('i686' 'x86_64')
url="http://linuxtv.org/hg/~anttip/"
license=('GPL')
source=('http://palosaari.fi/linux/v4l-dvb/firmware/ec168/dvb-usb-ec168.fw')
md5sums=('7f38bf1ade8331f7190e75c75b3d37cf')

build() {
  cd $startdir/src/ || return 1
  mkdir -p $startdir/pkg/lib/firmware
  cp dvb-usb-ec168.fw $startdir/pkg/lib/firmware
}

