# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=distrho-juced
pkgver=20120518
pkgrel=1
pkgdesc="Plugins originally in the Jucetice project, then moved to Juced. In DISTRHO we took Capsaicin, DrumSynth and EQinox, making it work with new Juce code and in LV2 format. (SoundCrab is broken and will not be ported)."
url="http://distrho.sourceforge.net/"
arch=('x86_64')
license=('GPL')
depends=('lv2' 'p7zip')
source=(http://sourceforge.net/projects/distrho/files/Ports/Juced-plugins/juced-plugins_linux64_20120518.7z)
md5sums=('13d5bcca3ee98981e6804b9f4cbea353')
build() {
  cd $startdir/src/juced-plugins_linux64
  install -m 755 -d $startdir/pkg/usr/lib/lv2/{capsaicin.lv2,drumsynth.lv2,eqinox.lv2}
  install -m 644 -D lv2/capsaicin.lv2/* $startdir/pkg/usr/lib/lv2/capsaicin.lv2/
  install -m 644 -D lv2/drumsynth.lv2/* $startdir/pkg/usr/lib/lv2/drumsynth.lv2/
  install -m 644 -D lv2/eqinox.lv2/* $startdir/pkg/usr/lib/lv2/eqinox.lv2/
}
