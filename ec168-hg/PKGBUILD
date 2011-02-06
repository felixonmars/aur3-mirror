# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=ec168-hg
pkgver=hg
pkgrel=5
pkgdesc="usb dvb stick driver"
arch=('i686' 'x86_64')
url="http://linuxtv.org/hg/~anttip/"
license=('GPL')
install='ec168.install'
source=('http://palosaari.fi/linux/v4l-dvb/firmware/ec168/dvb-usb-ec168.fw' 'config')
md5sums=('7f38bf1ade8331f7190e75c75b3d37cf' '7bf465be99a6968f02544f085eda72fc')

build() {
  cd $startdir/src/ || return 1
  [ -e tip.tar.bz2 ] || wget http://linuxtv.org/hg/~anttip/ec168/archive/tip.tar.bz2 || return 1

  rm -rf ec168*
  tar -jxf *tar.bz2 || return 1
  cd ec168*
  cp ../config v4l/.config
  #make
  #sed 's|#define NEED_USB_ENDPOINT_TYPE 1||g' -i v4l/config-compat.h

  # make || return 1
  make || return 1
  make DESTDIR="$startdir/pkg" install || return 1
  find $startdir/pkg -name "modules.*" | xargs rm
  find $startdir/pkg -name "dvb-usb.ko" | xargs rm
  mkdir -p $startdir/pkg/lib/firmware
  cp ../dvb-usb-ec168.fw $startdir/pkg/lib/firmware
}

