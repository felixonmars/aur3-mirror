# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=vex
pkgname=('vex-lv2-bin' 'vex-vst-bin')
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/vex-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/vex-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_vex-vst-bin() {
  pkgdesc="Vex is a 3 oscillator subtractive waverom synth VST plugin"
  cd vex-${_arch}
  install -dm755 $pkgdir/usr/lib/vst
  for vst in `ls *.so`; do
	install $vst -t $pkgdir/usr/lib/vst
  done
}

package_vex-lv2-bin() {
  pkgdesc="Vex is a 3 oscillator subtractive waverom synth LV2 plugin"
  cd vex-${_arch}
  for lv2dir in `find . -name '*.lv2'`; do
	install -dm755 $pkgdir/usr/lib/lv2/$lv2dir
	install $lv2dir/* -t $pkgdir/usr/lib/lv2/$lv2dir
  done
}

md5sums_i686=('a9d6525ce049f744ca6454e9816c4346')
md5sums_x86_64=('790a592274f8a43761c3ca6928afc093')
