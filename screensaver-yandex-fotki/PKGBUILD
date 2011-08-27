# Contributor: pumbur <pumbur@ya.ru>
pkgname=screensaver-yandex-fotki
pkgver=0.10
pkgrel=1
pkgdesc="Screensaver Yandex.Fotki for Gnome"
arch=('i686' 'x86_64')
url="http://nano.yandex.ru/project/yafotki-screensaver/"
license=("GPL2")
depends=('gnome-screensaver' 'curl' 'libxml2' 'imagemagick' 'glew')
source=("http://nano.yandex.ru/static/releases/yandex-fotki-saver_${pkgver}.tar.gz")
sha1sums=('d25cc822c06f14314e1d398642cd9103588ffe23')
build() {
  cd $srcdir/yandex-fotki-saver-0.10/Release
  make
  mkdir -p $pkgdir/usr/lib/xscreensaver
  mkdir -p $pkgdir/usr/share/applications/screensavers
  mkdir -p $pkgdir/usr/share/doc/screensaver-yandex-fotki
  cp ./YandexFotkiSaver $pkgdir/usr/lib/xscreensaver
  cp ../debian/{changelog,copyright} $pkgdir/usr/share/doc/screensaver-yandex-fotki
  cp ../data/* $pkgdir/usr/share/applications/screensavers
}
