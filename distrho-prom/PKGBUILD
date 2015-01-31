# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=distrho-prom
pkgname=('distrho-prom-vst-bin' 'distrho-prom-lv2-bin' )
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/distrho-prom-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/distrho-prom-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_distrho-prom-vst-bin() {
  pkgdesc="DISTRHO ProM makes projectM (an awesome music visualizer) work as an  VST audio plugin"
  cd distrho-prom-${_arch}
  install -dm755 $pkgdir/usr/lib/vst
  for vst in `ls *.so`; do
	install $vst -t $pkgdir/usr/lib/vst
  done
}

package_distrho-prom-lv2-bin() {
  pkgdesc="DISTRHO ProM makes projectM (an awesome music visualizer) work as an LV2 audio plugin"
  cd distrho-prom-${_arch}
  for lv2dir in `find . -name '*.lv2'`; do
	install -dm755 $pkgdir/usr/lib/lv2/$lv2dir
	install $lv2dir/* -t $pkgdir/usr/lib/lv2/$lv2dir
  done
}
md5sums_i686=('e9a97701f47a34cbfa13f3432ea32a11')
md5sums_x86_64=('eae42b12051d6b4e059b46aefc7377a3')
