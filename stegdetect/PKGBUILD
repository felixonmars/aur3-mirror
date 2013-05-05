# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=stegdetect
pkgver=0.6
pkgrel=4
pkgdesc="An automated tool for detecting steganographic content in images"
arch=('i686' 'x86_64')
url="http://www.outguess.org/"
license=('GPL')
depends=('gtk' 'libevent')
source=("http://www.outguess.org/$pkgname-$pkgver.tar.gz"
        "$pkgname-unified.patch")
md5sums=('850a3551b5c450b9f450a919ad021767'
         '25ab094e8cbd457877bd915af12bffa8')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/${source[1]##*/}"
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
