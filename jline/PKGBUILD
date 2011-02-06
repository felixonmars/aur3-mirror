# Contributor: Christoffer Hirth [toffyrn(at)toffyrn(dot)net]

pkgname=jline
pkgver=0.9.94
pkgrel=4
pkgdesc="A Java library for handling console input. Similar to GNU Readline."
arch=('i686' 'x86_64')
url="http://jline.sourceforge.net"
license=('BSD')
depends=('java-environment')
source=(http://downloads.sourceforge.net/jline/jline-0.9.94.zip)
md5sums=('cd4aad9fb454e8acf7af476dae8abb72')

build() {
	#Creating directories
	install -d -m755 $pkgdir/usr/lib/$pkgname
	install -d -m755 $pkgdir/usr/share/licenses/$pkgname/
	install -d -m755 $pkgdir/usr/share/doc/$pkgname/

	#Installing the jar file.
	cp $srcdir/$pkgname-$pkgver/$pkgname-$pkgver.jar $pkgdir/usr/lib/$pkgname/$pkgname.jar

	#Installing the javadoc. (And examples)
	cp -R $srcdir/$pkgname-$pkgver/apidocs/ $pkgdir/usr/share/doc/$pkgname/
	cp -R $srcdir/$pkgname-$pkgver/examples/$pkgname/example/ $pkgdir/usr/share/doc/$pkgname/
	
	#Installing license
	cp $srcdir/$pkgname-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
}


