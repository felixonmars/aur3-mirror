# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=pitcheddelay
pkgname=('pitcheddelay-vst-bin' 'pitcheddelay-lv2-bin' )
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/pitcheddelay-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/pitcheddelay-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_pitcheddelay-vst-bin() {
  cd pitcheddelay-${_arch}
  pkgdesc="PitchedDelay is a VST delay plugin that allows the pitching of the delayed signal, within or outside the feedback loop"
  install -Dm755 PitchedDelay.so $pkgdir/usr/lib/vst/PitchedDelay.so
}

package_pitcheddelay-lv2-bin() {
  cd pitcheddelay-${_arch}
  pkgdesc="PitchedDelay is a LV2 plugin delay that allows the pitching of the delayed signal, within or outside the feedback loop"
  install -dm755 $pkgdir/usr/lib/PitchedDelay.lv2
  install PitchedDelay.lv2/* -t $pkgdir/usr/lib/PitchedDelay.lv2
}
md5sums_i686=('65a086cc54cdf28f1179ea831af37d82')
md5sums_x86_64=('93c0d6c1600107d79c7d30563aae20b0')
