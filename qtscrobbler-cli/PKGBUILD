# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=qtscrobbler-cli
_pkgname=qtscrob
pkgver=0.10
pkgrel=2
pkgdesc="A tool for submitting .scrobbler.log from portable players to Last.fm"
arch=('i686' 'x86_64')
url="http://qtscrob.sourceforge.net/"
license=('GPL')
groups=()
depends=('curl' 'libmtp')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/project/$_pkgname/$_pkgname/$pkgver/$_pkgname-0.10.tar.bz2 libmtp.cpp.patch)
noextract=()

build() {
  cd $srcdir
  patch -p0 < $srcdir/libmtp.cpp.patch
  cd "$srcdir/$_pkgname-$pkgver"
  cd src/cli

  make || return 1
  make prefix="" DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
md5sums=('5d1e477dcf8f9fba89a77715c02b1403'
         'd563fe25234e733c2ad1a5b6645e28d9')
