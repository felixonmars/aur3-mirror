# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com)

pkgbase=stereosourceseparation
pkgname=('stereosourceseparation-vst-bin' 'stereosourceseparation-lv2-bin')
pkgver=20140826
pkgrel=1
url="http://distrho.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

source_i686=("http://sourceforge.net/projects/distrho/files/2014-08-26/stereosourceseparation-linux32bit.tar.xz")
source_x86_64=("http://sourceforge.net/projects/distrho/files/2014-08-26/stereosourceseparation-linux64bit.tar.xz")

[[ "$CARCH" = 'x86_64' ]] && _arch=linux64bit
[[ "$CARCH" = 'i686' ]] && _arch=linux32bit

package_stereosourceseparation-vst-bin() {
  pkgdesc="This is a VST plugin that uses the spatial information hidden in the stereo signal to accomplish source separation."
  cd stereosourceseparation-${_arch}
  install -Dm755 StereoSourceSeparation.so $pkgdir/usr/lib/vst/Stereosourceseparation.so
}

package_stereosourceseparation-lv2-bin() {
  pkgdesc="This is a LV2 plugin that uses the spatial information hidden in the stereo signal to accomplish source separation."
  cd stereosourceseparation-${_arch}
  install -dm755 $pkgdir/usr/lib/StereoSourceSeparation.lv2
  install StereoSourceSeparation.lv2/* -t $pkgdir/usr/lib/StereoSourceSeparation.lv2
}
md5sums_i686=('3631b2c2200d6e3c93d37ead06916202')
md5sums_x86_64=('d2d1fb0e811874afb4fe61259fca7732')
