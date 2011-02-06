# Contributor: honzor <dorhonzor@gmail.com>
pkgname=veejay-client
pkgver=1.5.3
pkgrel=3
pkgdesc="Veejay is a visual instrument and realtime video sampler for GNU/Linux"
arch=('i686' 'x86_64')
url="http://www.veejayhq.net"
groups=('veejay')
license="GPL"
depends=('veejay-server' 'libxml2' 'jack-audio-connection-kit' 'ffmpeg' 'mjpegtools')
makedepends=('veejay-server')
source=(http://downloads.sourceforge.net/project/veejay/veejay-1.5-src/veejay-$pkgver.tar.bz2)
md5sums=('f28cec207ed1331c278a0dc9bfc03b5b')

build() {
  cd $startdir/src/veejay-$pkgver/veejay-client
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}