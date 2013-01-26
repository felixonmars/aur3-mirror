# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=threadzip
pkgver=1.2
pkgrel=1
pkgdesc="A parallel, threaded zip, zlib, lzo, bzip2, lzma, or whatever compressor" 
arch=('any')
url="http://code.google.com/p/threadzip"
license=('GPL')
depends=('python')
source=("http://threadzip.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('d8bfe76e4e48d4f568fc7bb25f1dd712')

package() {
	for file in threadzip.py threadunzip.py; do
		install -Dm 755 "$srcdir/$pkgname-$pkgver/python/$file" "$pkgdir/usr/bin/$file"
		sed -i 's,\(#!\)/usr/bin/python,\1/usr/bin/env python2,' "$pkgdir/usr/bin/$file"
	done
}
