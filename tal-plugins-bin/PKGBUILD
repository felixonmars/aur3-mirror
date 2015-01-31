# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=tal-plugins-bin
pkgname=('tal-plugins-lv2-bin' 'tal-plugins-vst-bin')
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/tal-plugins-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/tal-plugins-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_tal-plugins-vst-bin() {
  pkgdesc="Togu Audio Line VST Plugins Dub-3, Filter, NoiseMaker, Reverb and Vocoder"
  cd tal-plugins-${_arch}
  install -dm755 $pkgdir/usr/lib/vst
  for vst in `ls *.so`; do
	install $vst -t $pkgdir/usr/lib/vst
  done
}

package_tal-plugins-lv2-bin() {
  pkgdesc="Togu Audio Line LV2 Plugins Dub-3, Filter, NoiseMaker, Reverb and Vocoder"
  cd tal-plugins-${_arch}
  for lv2dir in `find . -name '*.lv2'`; do
	install -dm755 $pkgdir/usr/lib/lv2/$lv2dir
	install $lv2dir/* -t $pkgdir/usr/lib/lv2/$lv2dir
  done
}

md5sums_i686=('298a31d4c80b81be0cd3cc5b3dc093dc')
md5sums_x86_64=('f255165b25528ebf2f9ebfbe917f131d')
