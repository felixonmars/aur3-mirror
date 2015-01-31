# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=juced-plugins
pkgname=('juced-plugins-vst-bin' 'juced-plugins-lv2-bin' )
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/juced-plugins-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/juced-plugins-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_juced-plugins-vst-bin() {
  pkgdesc="VST Plugins originally in the Jucetice project: DrumSynth and EQinox"
  cd juced-plugins-${_arch}
  install -dm755 $pkgdir/usr/lib/vst
  for vst in `ls *.so`; do
	install $vst -t $pkgdir/usr/lib/vst
  done
}

package_juced-plugins-lv2-bin() {
  pkgdesc="LV2 Plugins originally in the Jucetice project: DrumSynth and EQinox"
  cd juced-plugins-${_arch}
  for lv2dir in `find . -name '*.lv2'`; do
	install -dm755 $pkgdir/usr/lib/lv2/$lv2dir
	install $lv2dir/* -t $pkgdir/usr/lib/lv2/$lv2dir
  done
}
md5sums_i686=('40b5ceb2d9e70cb136ddc1969831fa93')
md5sums_x86_64=('f0d3addeab7bcefc9c4992f4dcab94f0')
