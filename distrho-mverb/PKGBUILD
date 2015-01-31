# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=distrho-mverb
pkgname=('distrho-mverb-vst-bin' 'distrho-mverb-lv2-bin' 'distrho-mverb-dssi-bin' 'distrho-mverb-ladspa-bin' )
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/distrho-mverb-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/distrho-mverb-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_distrho-mverb-vst-bin() {
  pkgdesc="MVerb is a studio quality, open-source VST reverb"
  cd distrho-mverb-${_arch}
  install -dm755 $pkgdir/usr/lib/vst
  for vst in `ls *vst.so`; do
	install $vst -t $pkgdir/usr/lib/vst
  done
}

package_distrho-mverb-lv2-bin() {
  pkgdesc="MVerb is a studio quality, open-source LV2 reverb"
  cd distrho-mverb-${_arch}
  for lv2dir in `find . -name '*.lv2'`; do
	install -dm755 $pkgdir/usr/lib/lv2/$lv2dir
	install $lv2dir/* -t $pkgdir/usr/lib/lv2/$lv2dir
  done
}

package_distrho-mverb-dssi-bin() {
  pkgdesc="MVerb is a studio quality, open-source DSSI reverb"
  cd distrho-mverb-${_arch}
  install -Dm755 MVerb-dssi.so $pkgdir/usr/lib/dssi/MVerb-dssi.so
  install -Dm755 MVerb-dssi/MVerb_ui $pkgdir/usr/lib/dssi/MVerb-dssi/MVerb_ui
}

package_distrho-mverb-ladspa-bin() {
  pkgdesc="MVerb is a studio quality, open-source LADSPA reverb"
  cd distrho-mverb-${_arch}
  install -Dm755 MVerb-ladspa.so $pkgdir/usr/lib/ladspa/MVerb.so
}
md5sums_i686=('0fdd0f9db8236a620fffa07f4c632087')
md5sums_x86_64=('3b644665e92c4ab20f694f39b1c7d7f9')
