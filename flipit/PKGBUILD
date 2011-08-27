# Author: Chuck Hallenbeck <chuckh@ftml.net>
pkgname=flipit
pkgver=1.2
pkgrel=1
pkgdesc="Command line toy for randomly playing audio clips from simple archives"
arch=(i686 x86_64)
url="http://edway.ftml.net/"
license=('GPL')
depends=(libsndfile alsa-lib vorbis-tools speex)
provides=(flip)
source=("http://edway.ftml.net/flipit-$pkgver.tar.gz")

build() {
  cd "$srcdir/flipit-1" || return 1
  make prefix=/usr DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:

md5sums=('931715fb51d7e685c9ba86e97d9d651d')
