# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=toonloop
pkgver=2.2.0
pkgrel=1
pkgdesc="A live stop motion animation software."
arch=('i686' 'x86_64')
url="http://toonloop.com/"
license=('GPL3')
depends=('boost-libs' 'clutter-gst' 'libavc1394' 'liblo' 'stk')
makedepends=('boost')
optdepends=('bash-completion: auto-completion support')
install="$pkgname.install"
source=("http://tarballs.quessy.net/$pkgname-$pkgver.tar.gz")
md5sums=('9d0bb75c5572c9e54b625a06d0b657d5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
