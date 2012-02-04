# Contributor: Ralf Barth <archlinux dot org at haggy dot org>

pkgname=splashy-theme-xbmc
pkgver=1.2
pkgrel=3
pkgdesc="Splashy theme for xbmc"
license=('custom')
arch=('any')
url="http://www.xbmc.org"
depends=('splashy')
conflicts=()
source=('background.png' 
        'theme.xml' 
        'FreeSans.ttf')
md5sums=('103c523ef0281543219ff6c44d1c2af5'
         'eb509bd5c5750a9a07869a2fc1aac006'
         '386bc37d7641e0cde8afc540bb2f0f57')

build() {
  cd $startdir/src/
  install -m 644 -D background.png $startdir/pkg/usr/share/splashy/themes/xbmc/background.png
  install -m 644 -D theme.xml $startdir/pkg/usr/share/splashy/themes/xbmc/theme.xml
  install -m 644 -D FreeSans.ttf $startdir/pkg/usr/share/splashy/themes/xbmc/FreeSans.ttf
}
