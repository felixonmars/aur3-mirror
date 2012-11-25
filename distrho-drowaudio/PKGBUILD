# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=distrho-drowaudio
pkgver=20120518
pkgrel=1
pkgdesc="Professional grade audio plugin suite from dRowAudio, now available for Linux. Ported to LV2"
url="http://distrho.sourceforge.net/"
arch=('x86_64')
license=('GPL')
depends=('lv2' 'p7zip')
source=(http://sourceforge.net/projects/distrho/files/Ports/dRowAudio-Plugins/drowaudio-plugins_linux64_20120518.7z)
md5sums=('6535e4d83f97144b7b6425ab3221b11a')
build() {
  cd $startdir/src/drowaudio-plugins_linux64
  install -m 755 -d $startdir/pkg/usr/lib/lv2/{drowaudio-distortion.lv2,drowaudio-distortionshaper.lv2,drowaudio-tremolo.lv2,drowaudio-flanger.lv2,drowaudio-reverb.lv2}
  install -m 644 -D lv2/drowaudio-distortion.lv2/* $startdir/pkg/usr/lib/lv2/drowaudio-distortion.lv2/
  install -m 644 -D lv2/drowaudio-distortionshaper.lv2/* $startdir/pkg/usr/lib/lv2/drowaudio-distortionshaper.lv2/
  install -m 644 -D lv2/drowaudio-tremolo.lv2/* $startdir/pkg/usr/lib/lv2/drowaudio-tremolo.lv2/
  install -m 644 -D lv2/drowaudio-flanger.lv2/* $startdir/pkg/usr/lib/lv2/drowaudio-flanger.lv2/
  install -m 644 -D lv2/drowaudio-reverb.lv2/* $startdir/pkg/usr/lib/lv2/drowaudio-reverb.lv2/
}
