# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=seeker
pkgver=2.0
pkgrel=1
pkgdesc="A non-destructive tool for benchmarking disk access time via a random access pattern"
arch=('i686' 'x86_64')
url="http://www.linuxinsight.com/how_fast_is_your_disk.html"
license=('GPL')
source=("http://www.linuxinsight.com/files/$pkgname.c")
md5sums=('e3b70f67ca60e8f5ea3a8d237b423f9a')

build() {
 gcc $CFLAGS "$srcdir/$pkgname.c" -o "$srcdir/$pkgname"
}

package() {
 install -Dm 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
