# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=wolpertinger
pkgname=('wolpertinger-lv2-bin' 'wolpertinger-vst-bin')
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/wolpertinger-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/wolpertinger-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_wolpertinger-vst-bin() {
  pkgdesc="wolpertinger is a 3 oscillator subtractive waverom synth VST plugin"
  cd wolpertinger-${_arch}
  install -dm755 $pkgdir/usr/lib/vst
  for vst in `ls *.so`; do
	install $vst -t $pkgdir/usr/lib/vst
  done
}

package_wolpertinger-lv2-bin() {
  pkgdesc="wolpertinger is a 3 oscillator subtractive waverom synth LV2 plugin"
  cd wolpertinger-${_arch}
  for lv2dir in `find . -name '*.lv2'`; do
	install -dm755 $pkgdir/usr/lib/lv2/$lv2dir
	install $lv2dir/* -t $pkgdir/usr/lib/lv2/$lv2dir
  done
}
md5sums_i686=('9c4a2bbc73f22838346c071e2db6db86')
md5sums_x86_64=('0db649967d479c5ae14c726599f6b802')
