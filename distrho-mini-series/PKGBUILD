# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=distrho-mini-series
pkgname=('distrho-mini-series-vst-bin' 'distrho-mini-series-lv2-bin' 'distrho-mini-series-dssi-bin' 'distrho-mini-series-ladspa-bin' )
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/distrho-mini-series-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/distrho-mini-series-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_distrho-mini-series-vst-bin() {
  pkgdesc="A small collection of small but useful VST plugins: 3-Band EQ, 3-Band Splitter, Ping Pong Pan"
  cd distrho-mini-series-${_arch}
  install -dm755 $pkgdir/usr/lib/vst
  for vst in `ls *vst.so`; do
	install $vst -t $pkgdir/usr/lib/vst
  done
}

package_distrho-mini-series-lv2-bin() {
  pkgdesc="A small collection of small but useful LV2 plugins: 3-Band EQ, 3-Band Splitter, Ping Pong Pan"
  cd distrho-mini-series-${_arch}
  for lv2dir in `find . -name '*.lv2'`; do
	install -dm755 $pkgdir/usr/lib/lv2/$lv2dir
	install $lv2dir/* -t $pkgdir/usr/lib/lv2/$lv2dir
  done
}

package_distrho-mini-series-dssi-bin() {
  pkgdesc="A small collection of small but useful DSSI plugins: 3-Band EQ, 3-Band Splitter, Ping Pong Pan"
  cd distrho-mini-series-${_arch}

  install -Dm755 3BandEQ-dssi.so $pkgdir/usr/lib/dssi/3BandEQ-dssi.so
  install -Dm755 3BandEQ-dssi/3BandEQ_ui $pkgdir/usr/lib/dssi/3BandEQ-dssi/3BandEQ_ui

  install -Dm755 3BandSplitter-dssi.so $pkgdir/usr/lib/dssi/3BandSplitter-dssi.so
  install -Dm755 3BandSplitter-dssi/3BandSplitter_ui $pkgdir/usr/lib/dssi/3BandSplitter-dssi/3BandSplitter_ui

  install -Dm755 PingPongPan-dssi.so $pkgdir/usr/lib/dssi/PingPongPan-dssi.so
  install -Dm755 PingPongPan-dssi/PingPongPan_ui $pkgdir/usr/lib/dssi/PingPongPan-dssi/PingPongPan_ui
}


package_distrho-mini-series-ladspa-bin() {
  pkgdesc="A small collection of small but useful LADSPA plugins: 3-Band EQ, 3-Band Splitter, Ping Pong Pan"
  cd distrho-mini-series-${_arch}
  install -dm755 $pkgdir/usr/lib/ladspa
  install -Dm755 *-ladspa.so -t $pkgdir/usr/lib/ladspa
}

md5sums_i686=('53f6b020b33b750e715227cd1f031cb9')
md5sums_x86_64=('7398e50083a59e0c03bb207c564178b8')
