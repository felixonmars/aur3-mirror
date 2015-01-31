# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=distrho-nekobi
pkgname=('distrho-nekobi-vst-bin' 'distrho-nekobi-lv2-bin' 'distrho-nekobi-dssi-bin')
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/distrho-nekobi-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/distrho-nekobi-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_distrho-nekobi-vst-bin() {
  pkgdesc="Nekobi is a simple single-oscillator VST synth based on the Roland TB-303"
  cd distrho-nekobi-${_arch}
  install -dm755 $pkgdir/usr/lib/vst
  for vst in `ls *vst.so`; do
	install $vst -t $pkgdir/usr/lib/vst
  done
}

package_distrho-nekobi-lv2-bin() {
  pkgdesc="Nekobi is a simple single-oscillator LV2 synth based on the Roland TB-303"
  cd distrho-nekobi-${_arch}
  for lv2dir in `find . -name '*.lv2'`; do
	install -dm755 $pkgdir/usr/lib/lv2/$lv2dir
	install $lv2dir/* -t $pkgdir/usr/lib/lv2/$lv2dir
  done
}

package_distrho-nekobi-dssi-bin() {
  pkgdesc="Nekobi is a simple single-oscillator DSSI synth based on the Roland TB-303"
  cd distrho-nekobi-${_arch}
  install -Dm755 Nekobi-dssi.so $pkgdir/usr/lib/dssi/Nekobi-dssi.so
  install -Dm755 Nekobi-dssi/Nekobi_ui $pkgdir/usr/lib/dssi/Nekobi-dssi/Nekobi_ui
}

md5sums_i686=('6dde618259cd7e55abc7312c6547a835')
md5sums_x86_64=('22263029e71c8682bee576aba0267d09')
