# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=lib32-distrho-drowaudio
pkgver=20120518
pkgrel=1
pkgdesc="Professional grade audio plugin suite from dRowAudio, now available for Linux. Ported to LV2"
url="http://distrho.sourceforge.net/"
arch=('i686')
license=('GPL')
depends=('lv2' 'p7zip')
source=(http://sourceforge.net/projects/distrho/files/Ports/dRowAudio-Plugins/drowaudio-plugins_linux32_20120518.7z)
md5sums=('10eec27f4ef2fb3828d8fd636fab070b')
build() {
  cd $startdir/src/drowaudio-plugins_linux32
  install -m 755 -d $startdir/pkg/usr/lib/lv2/{drowaudio-distortion.lv2,drowaudio-distortionshaper.lv2,drowaudio-tremolo.lv2,drowaudio-flanger.lv2,drowaudio-reverb.lv2}
  install -m 644 -D lv2/drowaudio-distortion.lv2/* $startdir/pkg/usr/lib/lv2/drowaudio-distortion.lv2/
  install -m 644 -D lv2/drowaudio-distortionshaper.lv2/* $startdir/pkg/usr/lib/lv2/drowaudio-distortionshaper.lv2/
  install -m 644 -D lv2/drowaudio-tremolo.lv2/* $startdir/pkg/usr/lib/lv2/drowaudio-tremolo.lv2/
  install -m 644 -D lv2/drowaudio-flanger.lv2/* $startdir/pkg/usr/lib/lv2/drowaudio-flanger.lv2/
  install -m 644 -D lv2/drowaudio-reverb.lv2/* $startdir/pkg/usr/lib/lv2/drowaudio-reverb.lv2/
}
