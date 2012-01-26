# Maintainer: BxS <bxsbxs at gmail dot com>

pkgname=microchip-mplabc32_bin
pkgver=2.02
pkgrel=2
pkgdesc="C compiler for PIC32 MCUs"
arch=(i686 x86_64)
url='http://www.microchip.com/stellent/idcplg?IdcService=SS_GET_PAGE&nodeId=2615&dDocName=en532454'
license=(custom)
[ $CARCH = x86_64 ] && depends=(lib32-glibc)
provides=(mplabc32)
conflicts=(mplabc32)
options=(!strip docs libtool emptydirs !zipman)
install=$pkgname.install
instdir=/opt/microchip/mplabc32/v$pkgver
installer=mplabc32-v$pkgver-a-linux-installer.run
source=(http://ww1.microchip.com/downloads/mplab/X/$installer
        LICENSE)
md5sums=(615c4913d8d6627fb3cff703b810bf86
         df627e8e84b3708d7c6dd2c4ee9d16c3)

package() {
  echo -e "Creating Package\n  Please Wait..."

  cd $pkgdir

  mkdir -p $pkgdir$instdir

  chmod 0755 $srcdir/$installer
  $srcdir/$installer --prefix $pkgdir$instdir --edition lite --mode unattended &> /dev/null

  rm $pkgdir$instdir/Uninstall*

  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
