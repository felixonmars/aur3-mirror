# Contributor: Elyess Zouaghi <elyess@zouaghi.net>
# Original: Tim Yang <tdy@gmx.com>
pkgname=utube-qt
pkgver=1.7
pkgrel=1
pkgdesc="A graphical (QT) downloader and ripper for YouTube videos"
arch=('i686' 'x86_64')
url=("http://sourceforge.net/projects/utube/")
license=('LGPL')
depends=('gambas2' 'wget')
optdepends=('ffmpeg: for FLV conversion')
source=(http://downloads.sourceforge.net/utube/utube-$pkgver.src.qt.tar.gz
        utube.desktop)
conflicts=('utube', 'utube-gtk')
provides=('utube')
md5sums=('5d41cbafbde7b10fb4ab29792233ff11'
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
