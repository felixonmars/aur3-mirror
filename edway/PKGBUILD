# Contributor: Chuck Hallenbeck <chuckh@ftml.net>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
pkgname=edway
pkgver=0.2.13
pkgrel=1
pkgdesc="Audio editor with an ed-style interface"
arch=(i686 x86_64)
url="http://edway.wordpress.com/"
license=('GPL')
depends=(libsndfile alsa-lib readline)
provides=(edway)
source=("http://edway.ftml.net/edway-$pkgver.tar.gz")

build() {
  cd "$srcdir/edway-0.2"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

md5sums=('431022bd6a4ccec938c65eddd9141a0b')
