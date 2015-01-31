# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=luftikus
pkgname=('luftikus-vst-bin' 'luftikus-lv2-bin' )
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/luftikus-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/luftikus-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_luftikus-vst-bin() {
  cd luftikus-${_arch}
  pkgdesc="Luftikus is a digital adaptation of an analog EQ with fixed half-octave bands and additional high frequency boost - VST"
  install -Dm755 Luftikus.so $pkgdir/usr/lib/vst/Luftikus.so
}

package_luftikus-lv2-bin() {
  cd luftikus-${_arch}
  pkgdesc="Luftikus is a digital adaptation of an analog EQ with fixed half-octave bands and additional high frequency boost - LV2"
  install -dm755 $pkgdir/usr/lib/Luftikus.lv2
  install Luftikus.lv2/* -t $pkgdir/usr/lib/Luftikus.lv2
}

md5sums_i686=('7d6baaf9e36a8afec5384f4e104ea767')
md5sums_x86_64=('ab8d9328a2ae8c4c6ec21128658aca44')
