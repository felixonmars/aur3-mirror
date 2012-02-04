# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=rtpproxy
pkgver=1.2.1
pkgrel=2
pkgdesc="High-performance software proxy server for RTP streams"
url="http://www.rtpproxy.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
source=("http://b2bua.org/chrome/site/$pkgname-$pkgver.tar.gz")
md5sums=('b0b5d6cdce3f17cdbbac473c11a2d0e5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

