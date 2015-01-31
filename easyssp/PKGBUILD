# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=easyssp
pkgname=('easyssp-vst-bin' 'easyssp-lv2-bin' )
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/easyssp-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/easyssp-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_easyssp-vst-bin() {
  cd easyssp-${_arch}
  pkgdesc="Easy Sound Space Perception is a small and lightweight VST audio visualization tool with spectrometer and goniometer views"
  install -Dm755 EasySSP.so $pkgdir/usr/lib/vst/EasySSP.so
}

package_easyssp-lv2-bin() {
  cd easyssp-${_arch}
  pkgdesc="Easy Sound Space Perception is a small and lightweight LV2 audio visualization tool with spectrometer and goniometer views"
  install -dm755 $pkgdir/usr/lib/EasySSP.lv2
  install EasySSP.lv2/* -t $pkgdir/usr/lib/EasySSP.lv2
}
md5sums_i686=('4507179c5aafaa30003ab64885cd38af')
md5sums_x86_64=('24c4d2dd824de03490fa059459acba00')
