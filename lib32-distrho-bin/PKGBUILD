# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=lib32-distrho-bin
_pkgname=runabc
pkgver=20120518
pkgrel=1
pkgdesc="A small collection of small but useful plugins, based on the good old LOSER-Dev Plugins. This collection currently includes:3-Band EQ, 3-Band Splitter and Ping Pong Pan. Compiled for LV2"
url="http://distrho.sourceforge.net/"
arch=('i686')
license=('GPL')
depends=('lv2' 'p7zip')
source=(http://ufpr.dl.sourceforge.net/project/distrho/Plugins/distrho-plugins_linux32_20120518.7z)
md5sums=('60e4f91b651b5e9c4f3d733c680dbabc')
build() {
  cd $startdir/src/distrho-plugins_linux32
  install -m 755 -d $startdir/pkg/usr/lib/lv2/{3BandEQ.lv2,3BandSplitter.lv2,PingPongPan.lv2}
  install -m 644 -D lv2/3BandEQ.lv2/* $startdir/pkg/usr/lib/lv2/3BandEQ.lv2/
  install -m 644 -D lv2/3BandSplitter.lv2/* $startdir/pkg/usr/lib/lv2/3BandSplitter.lv2/
  install -m 644 -D lv2/PingPongPan.lv2/* $startdir/pkg/usr/lib/lv2/PingPongPan.lv2/
}
