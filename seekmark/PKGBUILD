# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=seekmark
pkgver=0.3
pkgrel=1
pkgdesc="A threaded disk benchmarking utility (useful for testing RAID arrays)"
arch=('i686' 'x86_64')
url="http://learnitwithme.com/?p=272"
license=('GPL')
source=("http://learnitwithme.com/wp-content/uploads/2011/02/$pkgname-$pkgver.c")
md5sums=('e149b5a9b4b020ad7cc5176019390b3b')

build() {
 gcc $CFLAGS -lpthread "$srcdir/$pkgname-$pkgver.c" -o "$srcdir/$pkgname"
}

package() {
 install -Dm 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
