# Contributor: honzor <dorhonzor@gmail.com>
pkgname=reloaded
pkgver=1.0
pkgrel=1
pkgdesc="gtkcairo gui for veejay"
arch=(i686)
url="http://www.veejayhq.net"
license="GPL"
depends=('gtkcairo' 'alsa-lib' 'libglade' 'ffmpeg' 'mjpegtools' 'veejay')
source=(http://www.veejayhq.net/releases/$pkgname-$pkgver.tar.bz2)
md5sums=('0ceb026068740f8c0d7fb459f1ec9249')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}