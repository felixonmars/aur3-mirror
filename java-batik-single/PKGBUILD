# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=java-batik-single
pkgver=1.7
pkgrel=1
pkgdesc="SVG library for Java (single jar files)"
arch=('i686' 'x86_64')
url="http://xmlgraphics.apache.org/batik/"
license=(APACHE)
depends=('java-commons-io' 'java-commons-logging' 'java-xmlgraphics-commons')
makedepends=('java-environment' 'apache-ant' 'unzip')
conflicts=('java-batik')
source=('http://apache.cict.fr/xmlgraphics/batik/batik-src-1.7.zip')
md5sums=('c117ca2241907f62a2b3031167ebf917')

build() {
	cd $srcdir/batik-$pkgver
	ant jars || return 1
	install -d $pkgdir/usr/share/java/batik || return 1
        rmdir $srcdir/batik-$pkgver/batik-$pkgver/docs
	cp -r $srcdir/batik-$pkgver/batik-$pkgver/* \
	  $pkgdir/usr/share/java/batik/ || return 1
}
