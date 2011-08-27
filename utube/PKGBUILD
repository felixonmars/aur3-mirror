# Contributor: Tim Yang <tdy@gmx.com>
pkgname=utube
pkgver=1.7
pkgrel=1
pkgdesc="A graphical downloader and ripper for YouTube videos"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/utube/"
license=('LGPL')
depends=('gambas2' 'wget')
optdepends=('ffmpeg: for FLV conversion')
source=(http://downloads.sourceforge.net/utube/utube-$pkgver.src.gtk.tar.gz
        utube.desktop)
md5sums=('dd4b49abb8b99a7503e0d6cd56cf8ac9'
         'e89af3e957dd7a07be3f7aaffa3920e6')

build() {
  cd "$srcdir/utube-$pkgver"
  sed -i 's#\./#/usr/share/utube/#' utube/UTube.sh
  ./configure --prefix=/usr || return 1
  make || return 1
  install -Dm755 utube/UTube.sh "$pkgdir/usr/bin/utube"
  install -Dm755 utube/utube.gambas "$pkgdir/usr/share/utube/utube.gambas"
  install -Dm644 utube/dlcomplete.wav "$pkgdir/usr/share/utube/dlcomplete.wav"
  install -Dm644 utube/utube.png "$pkgdir/usr/share/pixmaps/utube.png"
  install -Dm644 ../utube.desktop "$pkgdir/usr/share/applications/utube.desktop"
}
