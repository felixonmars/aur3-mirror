# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=lib32-distrho-hybridreverb2
pkgver=20120518
pkgrel=1
pkgdesc="HybridReverb2 is a convolution-based reverberation effect which combines the superior sound quality of a convolution reverb with the tuning capability of a feedback delay network. This plugin was updated to latest Juce and now is available as LV2."
url="http://distrho.sourceforge.net/"
arch=('i686')
license=('GPL')
depends=('lv2' 'p7zip')
source=(http://sourceforge.net/projects/distrho/files/Ports/HybridReverb2/hybridreverb2_linux32_20120518.7z)
md5sums=('2626cda4f87832b580169a9b967b457f')
build() {
  cd $startdir/src/hybridreverb2_linux32
  install -m 755 -d $startdir/pkg/usr/lib/lv2/HybridReverb2.lv2
  install -m 644 -D lv2/HybridReverb2.lv2/* $startdir/pkg/usr/lib/lv2/HybridReverb2.lv2/
}
