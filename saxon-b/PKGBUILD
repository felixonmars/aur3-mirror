# Contributor: Leif Warner <abimelech@gmail.com>
pkgname=saxon-b
pkgver=9.1.0.8
pkgrel=1
pkgdesc="XSLT 2.0 / XPath 2.0 / XQuery 1.0 processor for Java - B edition (more features than new Home Edition)"
url="http://saxon.sourceforge.net/"
license="MPL"
arch=('any')
depends=('java-runtime')
provides=('java-saxon')
source=(http://downloads.sourceforge.net/saxon/saxonb`echo $pkgver | tr . -`j.zip
saxon-xslt.sh
saxon-xquery.sh)

md5sums=('b1d08c1e2483e31021ed6e59c281c369'
         '28ef85ff73c1260340419dff8d07ca50'
         'b7daa1bf3e696f2c5874de5636114628')

build() {
	cd $srcdir
	install -d $pkgdir/usr/share/java/saxon
	install -t $pkgdir/usr/share/java/saxon *.jar
	install -D -m 755 $srcdir/saxon-xslt.sh $pkgdir/usr/bin/saxon-xslt
	install -D -m 755 $srcdir/saxon-xquery.sh $pkgdir/usr/bin/saxon-xquery
}
