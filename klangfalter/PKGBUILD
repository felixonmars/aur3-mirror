# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=klangfalter
pkgname=('klangfalter-vst-bin' 'klangfalter-lv2-bin' )
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/klangfalter-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/klangfalter-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_klangfalter-vst-bin() {
  cd klangfalter-${_arch}
  pkgdesc="KlangFalter is a convolution audio VST plugin"
  install -Dm755 KlangFalter.so $pkgdir/usr/lib/vst/KlangFalter.so
}

package_klangfalter-lv2-bin() {
  cd klangfalter-${_arch}
  pkgdesc="KlangFalter is a convolution audio LV2 plugin"
  install -dm755 $pkgdir/usr/lib/KlangFalter.lv2
  install KlangFalter.lv2/* -t $pkgdir/usr/lib/KlangFalter.lv2
}
md5sums_i686=('a5b6dae6b250df216c5ea69eb5600c85')
md5sums_x86_64=('2647afc671343679db5bbf419530ca4f')
