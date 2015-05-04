# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>
pkgname=jgrapht
pkgver=0.9.1
pkgrel=1
pkgdesc=("Free Java graph library, provides mathematical graph-theory objects and algorithms.")
arch=('any')
url=("http://jgrapht.org")
license=('LGPL')
depends=('java-environment')
source=("http://prdownloads.sourceforge.net/jgrapht/$pkgname-$pkgver.tar.gz")

md5sums=('127a9c9c82eaecc5a5ab738f07271252')

package() {
	install -d "$pkgdir/usr/share/java/$pkgname/lib"  
	install -d "$pkgdir/usr/share/doc/$pkgname/"

	install -Dm755 "$srcdir/$pkgname-$pkgver/lib/$pkgname-ext-$pkgver-uber.jar" "$pkgdir/usr/share/java/$pkgname/lib/"
	cp -a "$srcdir/$pkgname-$pkgver/javadoc/." "$pkgdir/usr/share/doc/$pkgname/"
}
