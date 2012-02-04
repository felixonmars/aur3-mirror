# $Id: PKGBUILD,v 1 2006/12/22 22:16:54 voidnull Exp $
# Maintainer: Vojtech Biberle  <bazil.xxl@gmail.com>
# based on gspcav1ck

_kernver=`uname -r`
_kernname=kernel26`uname -r | sed 's/[0-9]\.[0-9]\.[0-9][0-9]-\([a-y]\)/\1/'`
pkgname=gspcav1all
pkgver=20070508
pkgrel=1
pkgdesc="A kernel module with support to 220 USB webcams"
url="http://mxhaard.free.fr"
license="GPL"
depends=($_kernname'>=2.6.11')
install=gspcav1all.install
source=(http://mxhaard.free.fr/spca50x/Download/gspcav1-$pkgver.tar.gz)
md5sums=('e18a21b80e1728c6b51b799d1e671f8c')
arch=("i686" "x68_64")
build() {
  cd $startdir/src/gspcav1-$pkgver
  make || return 1
  #Install kernel module
  install -D -m644 gspca.ko $startdir/pkg/lib/modules/$_kernver/kernel/drivers/media/video/usbvideo/gspca.ko
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
