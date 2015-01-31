# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=dexed
pkgname=('dexed-lv2-bin' 'dexed-vst-bin')
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/dexed-linux32bit-fixed.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/dexed-linux64bit-fixed.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit


package_dexed-vst-bin() {
  pkgdesc="Dexed is a VST plugin synth that is closely modeled on the Yamaha DX7"
  cd dexed-${_arch}
  install -dm755 $pkgdir/usr/lib/vst
  for vst in `ls *.so`; do
	install $vst -t $pkgdir/usr/lib/vst
  done
}

package_dexed-lv2-bin() {
  pkgdesc="Dexed is a LV2 plugin synth that is closely modeled on the Yamaha DX7"
  cd dexed-${_arch}
  for lv2dir in `find . -name '*.lv2'`; do
	install -dm755 $pkgdir/usr/lib/lv2/$lv2dir
	install $lv2dir/* -t $pkgdir/usr/lib/lv2/$lv2dir
  done
}

md5sums_i686=('9dd392ae728e8f367836cd718a16c79b')
md5sums_x86_64=('27a173161cf47e6ee394e807fef9db8f')
