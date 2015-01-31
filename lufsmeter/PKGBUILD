# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=lufsmeter
pkgname=('lufsmeter-vst-bin' 'lufsmeter-lv2-bin' )
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/lufsmeter-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/lufsmeter-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_lufsmeter-vst-bin() {
  pkgdesc="The LUFS Meter plugin measures loudness similar to the human perception of loudness - VST"
  cd lufsmeter-${_arch}
  install -dm755 $pkgdir/usr/lib/vst
  for vst in `ls *.so`; do
	install $vst -t $pkgdir/usr/lib/vst
  done
}

package_lufsmeter-lv2-bin() {
  pkgdesc="The LUFS Meter plugin measures loudness similar to the human perception of loudness - LV2"
  cd lufsmeter-${_arch}
  for lv2dir in `find . -name '*.lv2'`; do
	install -dm755 $pkgdir/usr/lib/lv2/$lv2dir
	install $lv2dir/* -t $pkgdir/usr/lib/lv2/$lv2dir
  done
}

md5sums_i686=('1b42ddb2177272bce1c5fe1c8ed5204e')
md5sums_x86_64=('a5f12b89b43fe235245e819559e84450')
