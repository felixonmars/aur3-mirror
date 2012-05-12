# Maintainer: SpepS <dreamspeper at yahoo dot it>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=phat
pkgver=0.4.1
pkgrel=5
pkgdesc="A collection of GTK+ widgets geared toward pro-audio apps"
arch=(i686 x86_64)
url="http://phat.berlios.de/"
license=('GPL')
depends=('libgnomecanvas')
options=('!libtool')
source=("http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname-gcc.patch")
md5sums=('b8d1d3ae0d7094d705a33753fe821ebc'
         '435cb309aa60949ba5133c3b04957066')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # gcc patch
  patch -p1 -i ../${source[1]}

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
