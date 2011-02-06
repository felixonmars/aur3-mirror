pkgname=nxt2004-fw
pkgver=1.0
pkgrel=1
pkgdesc="Firmware for nxt2004 (AVerHDTV, KWorld HDTV, etc.)"
url="http://www.aver.com"
arch=('i686' 'x86_64')
depends=()
install=()
source=(get_dvb_firmware)
md5sums=('355f47cc13a0b5baedbdd4db670d975d')

build() {
  cd $startdir/src
  perl get_dvb_firmware nxt2004

  install -D dvb-fe-nxt2004.fw $startdir/pkg/lib/firmware/dvb-fe-nxt2004.fw
}
