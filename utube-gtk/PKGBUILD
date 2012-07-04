# Original: Tim Yang <tdy@gmx.com>
# Contributor: Elyess Zouaghi <elyess@zouaghi.net>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=utube-gtk
pkgver=2.0
pkgrel=1
pkgdesc="A graphical (GTK) downloader and ripper for YouTube videos"
arch=('i686' 'x86_64')
url=("http://sourceforge.net/projects/utube/")
license=('LGPL')
depends=('gambas2-gb-gtk' 'gambas2-runtime' 'gambas2-gb-settings' 'gambas2-gb-sdl-sound' 'gambas2-gb-form' 'wget')
optdepends=('ffmpeg: for FLV conversion')
source=(http://downloads.sourceforge.net/utube/utube-$pkgver.src.gtk.tar.gz
        utube.desktop)
conflicts=('utube', 'utube-qt')
provides=('utube')
md5sums=('407303e1b6c21d8e967269bba8959e83'
         'e89af3e957dd7a07be3f7aaffa3920e6')

build() {
  cd "$srcdir/utube"
  sed -i 's#\./#/usr/share/utube/#' UTube.sh
  #./configure --prefix=/usr
  #make
  install -Dm755 UTube.sh "$pkgdir/usr/bin/utube"
  install -Dm755 utube.gambas "$pkgdir/usr/share/utube/utube.gambas"
  install -Dm644 dlcomplete.wav "$pkgdir/usr/share/utube/dlcomplete.wav"
  install -Dm644 utube.png "$pkgdir/usr/share/pixmaps/utube.png"
  install -Dm644 ../utube.desktop "$pkgdir/usr/share/applications/utube.desktop"
}
