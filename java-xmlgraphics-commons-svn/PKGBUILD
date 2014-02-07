# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=java-xmlgraphics-commons-svn
pkgver=r1565240
pkgrel=2
pkgdesc="Common components between FOP and Batik"
arch=('i686' 'x86_64')
url="http://xmlgraphics.apache.org/commons/"
license=(APACHE)
depends=('java-runtime')
makedepends=('apache-ant')
source=()
md5sums=()
provides=('java-xmlgraphics-commons')
conflicts=('java-xmlgraphics-commons')

build() {
	mkdir $srcdir/$pkgname-$pkgver
	cd $srcdir/$pkgname-$pkgver
	svn co http://svn.apache.org/repos/asf/xmlgraphics/commons/trunk
	cd trunk
	ant package || return 1
	install -d $pkgdir/usr/share/java/xmlgraphics-commons/ || return 1
	install --mode=644 $srcdir/$pkgname-$pkgver/trunk/build/xmlgraphics-commons*.jar \
	  $pkgdir/usr/share/java/xmlgraphics-commons/xmlgraphics-commons.jar || return 1
}
