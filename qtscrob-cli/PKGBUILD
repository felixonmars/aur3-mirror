# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=qtscrob-cli
_pkgname=qtscrob
pkgver=0.10
pkgrel=3
pkgdesc="A tool to upload information about the tracks you have played from your Digital Audio Player (DAP) to your last.fm account. Supports Apple iPods or DAPs running the Rockbox replacement firmware. (QTScrobbler)"
arch=('i686' 'x86_64')
url="http://qtscrob.sourceforge.net/"
license=('GPL')
depends=('curl' 'libmtp')
conflicts=('qtscrob')
source=(http://downloads.sourceforge.net/project/$_pkgname/$_pkgname/$pkgver/$_pkgname-0.10.tar.bz2 libmtp.cpp.patch)

build() {
  cd $srcdir
  patch -p0 < $srcdir/libmtp.cpp.patch
  cd "$srcdir/$_pkgname-$pkgver/src/cli"
  make || return 1
  make prefix="" DESTDIR="$pkgdir/usr" install
}

md5sums=('5d1e477dcf8f9fba89a77715c02b1403'
         'd563fe25234e733c2ad1a5b6645e28d9')
