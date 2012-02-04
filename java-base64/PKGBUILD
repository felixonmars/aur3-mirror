# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua

_upstream_Name=Base64
_upstream_name=base64

pkgname=java-base64
pkgver=2.3.7
pkgrel=1
pkgdesc="The Java class providing very fast Base64 encoding and decoding in the form of convenience methods and input/output streams"
arch=('i686' 'x86_64')
url="http://iharder.sourceforge.net"
license=('Public Domain')
depends=('java-runtime')
makedepends=('java-environment')
source=(http://downloads.sourceforge.net/project/iharder/${_upstream_name}/2.3/${_upstream_Name}-v${pkgver}.zip)

build() {
	mkdir -p $srcdir/${_upstream_Name}-v${pkgver}/{src,build}
	mkdir -p $pkgdir/usr/share/java/

	cd $srcdir/${_upstream_Name}-v${pkgver}

	echo -e 'package net.iharder.base64;\n\n' > src/Base64.java
	cat Base64.java >> src/Base64.java

	javac -d build src/Base64.java
}

package() {
	cd $srcdir/${_upstream_Name}-v${pkgver}

	jar cf $pkgdir/usr/share/java/java-base64.jar -C build .
}

md5sums=('0e235734061d4714f7b08b46cd783e45')
sha256sums=('28003fa44f7fc96f247a0da6e7cb451cce0423456ef8652c6f52a91df0e39edb')
