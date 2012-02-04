# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=ino-jsc
pkgver=0.4.0
pkgrel=1
pkgdesc="Ino JavaScriptCoreGTK+ 2/3 based implementations"
arch=('i686' 'x86_64')
url="http://naspro.atheme.org/"
license=('custom:ISC')
depends=("ino-headers>=$pkgver")
makedepends=('libwebkit' 'libwebkit3')
optdepends=('libwebkit: GTK2+ implementation'
            'libwebkit3: GTK3+ implementation')
options=('!libtool')
source=("http://download.sourceforge.net/project/naspro/naspro/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('fb5d3c29258c9da09e1959669cd3255c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
