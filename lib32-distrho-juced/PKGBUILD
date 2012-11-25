# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=lib32-distrho-juced
pkgver=20120518
pkgrel=1
pkgdesc="Plugins originally in the Jucetice project, then moved to Juced. In DISTRHO we took Capsaicin, DrumSynth and EQinox, making it work with new Juce code and in LV2 format. (SoundCrab is broken and will not be ported)."
url="http://distrho.sourceforge.net/"
arch=('i686')
license=('GPL')
depends=('lv2' 'p7zip')
source=(http://sourceforge.net/projects/distrho/files/Ports/Juced-plugins/juced-plugins_linux32_20120518-2.7z/download)
md5sums=('74a7450df4dc1123631b54940caf435c')
build() {
  cd $startdir/src/juced-plugins_linux32
  install -m 755 -d $startdir/pkg/usr/lib/lv2/{capsaicin.lv2,drumsynth.lv2,eqinox.lv2}
  install -m 644 -D lv2/capsaicin.lv2/* $startdir/pkg/usr/lib/lv2/capsaicin.lv2/
  install -m 644 -D lv2/drumsynth.lv2/* $startdir/pkg/usr/lib/lv2/drumsynth.lv2/
  install -m 644 -D lv2/eqinox.lv2/* $startdir/pkg/usr/lib/lv2/eqinox.lv2/
}
