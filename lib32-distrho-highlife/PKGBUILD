# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=lib32-distrho-highlife
pkgver=20120518
pkgrel=1
pkgdesc="discoDSP's Pro-grade HighLife, originally ported to Juce by kRAkEn/gORe, and now updated by us to latest Juce and made available as LV2."
url="http://distrho.sourceforge.net/"
arch=('i686')
license=('GPL')
depends=('lv2' 'p7zip')
source=(http://sourceforge.net/projects/distrho/files/Ports/HighLife/highlife_linux32_20120518.7z)
md5sums=('94b23fe9e55b0ee13b99d62a5083abc6')
build() {
  cd $startdir/src/highlife_linux32
  install -m 755 -d $startdir/pkg/usr/lib/lv2/highlife.lv2
  install -m 644 -D lv2/highlife.lv2/* $startdir/pkg/usr/lib/lv2/highlife.lv2/
}
