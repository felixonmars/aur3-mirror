# Contributor:  TDY <tdy@gmx.com>
# Contributor: rabyte <rabyte*gmail>

pkgname=xtwitter
pkgver=0.12
pkgrel=2
pkgdesc="A very tiny twitter client for X"
arch=('i686' 'x86_64')
url="http://www.cuspy.org/xtwitter/"
license=('GPL3')
depends=('curl' 'imlib2' 'liboauth' 'glib2' 'xorg-server' 'libjson')
makedepends=()
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/hamano/xtwitter/tarball/0.12)
md5sums=('4e2d675352ad13ae87fc9ba22a119405')

build() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd $srcdir/hamano-$pkgname-6c5ac1c

  ./autogen.sh
  ./configure --prefix=/usr \
      --disable-static \
      --enable-libnotify
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
