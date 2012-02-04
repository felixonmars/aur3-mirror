# Maintainer: Austin <doorknob60 at gmail dot com>
pkgname=project64
pkgver=1.6
pkgrel=4
pkgdesc="A very popular and accurate Nintendo 64 Emulator (run via wine)"
arch=('any')
url="http://www.pj64-emu.com/"
install=${pkgname}.install
license=('freeware')
depends=('wine')
source=('project64.sh' 'project64.desktop' 'http://img.informer.com/wiki/mediawiki/images/b/b4/Pj64logo.png' 'http://www.fileden.com/files/2006/8/16/169791/project64-1.6.tar.xz')
md5sums=('6e674194e5f5dbc54cdce7ecec8111d4' 'b8c715b9c3fae786b3daf6e050000cf7' '1df2812e378e9b0bd01436a751d32053' 'e7bb5d4e204f0124554c16c57021adc1')
options=(!strip)

build() {
  install -d -m755 $pkgdir/usr/share/
  cp -R project64 $pkgdir/usr/share/project64
  install -d -m755 $pkgdir/usr/bin
  install -m755 project64.sh $pkgdir/usr/bin/project64
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/pixmaps
  install -m755 project64.desktop $pkgdir/usr/share/applications
  install -m755 Pj64logo.png $pkgdir/usr/share/pixmaps/project64.png
  }

 
