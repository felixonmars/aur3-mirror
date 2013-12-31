# maintainer: perlawk

pkgname=smib
pkgver=0.34
pkgrel=1
pkgdesc="smib stands for SMall Is Beautiful and is a Computer Algebra System (CAS) for Linux."
url="http://smib.sourceforge.net/"
arch=('i686' 'x86_64')
license=('BSD')
source=("http://jaist.dl.sourceforge.net/project/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.zip")
install=
options=(strip)

build() {
	cd "$srcdir"/$pkgname-$pkgver/sources
	make
}

package() {
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/smib/doc
	cd "$srcdir"/$pkgname-$pkgver/sources
	cp "$srcdir"/$pkgname-$pkgver/sources/smib "$pkgdir"/usr/bin
	cp "$srcdir"/$pkgname-$pkgver/documentation/q*pdf "$pkgdir"/usr/share/smib/doc
	cp -a "$srcdir"/$pkgname-$pkgver/documentation/eigenmath "$pkgdir"/usr/share/smib/
	cp -a "$srcdir"/$pkgname-$pkgver/documentation/application "$pkgdir"/usr/share/smib/
}

md5sums=('f0815b48dd55f4891739e28481c3e354')
