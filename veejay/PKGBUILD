# Contributor: honzor <dorhonzor@gmail.com>
pkgname=veejay
pkgver=1.0
pkgrel=1
pkgdesc="Veejay is a visual instrument and realtime video sampler for GNU/Linux"
arch=(i686)
url="http://www.veejayhq.net"
license="GPL"
depends=('unicap' 'libxml2' 'jack-audio-connection-kit' 'ffmpeg' 'mjpegtools')
source=(http://downloads.sourceforge.net/veejay/$pkgname-$pkgver.tar.bz2)
md5sums=('a240c32a91f53a401e4d60b47ef2875c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}