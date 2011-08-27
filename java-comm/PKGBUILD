#Contributor: astaroth <astaroth_@web.de>
pkgname=java-comm
pkgver=3.0
pkgrel=2
pkgdesc="Java Communications API for accessing serial and parallel ports"
url="http://java.sun.com/products/javacomm/"
license="Custom"
source=(comm3.0_u1_linux.zip)
arch=('i686')
depends=(jre)
md5sums=('66f961de4a433eb4283751b98496b1a1')

build() {
    cd $startdir/commapi
    mkdir -p $startdir/pkg/$J2REDIR/lib/ext/
    mkdir -p $startdir/pkg/usr/share/licenses/$pkgname/
    install -m744 docs/license.txt \
	$startdir/pkg/usr/share/licenses/$pkgname/LICENSE
    install -m755 jar/comm.jar $startdir/pkg/$J2REDIR/lib/ext/
    install -m744 docs/javax.comm.properties $startdir/pkg/$J2REDIR/lib/
    mkdir -p $startdir/pkg/usr/lib
    install -m755 lib/*.so $startdir/pkg/usr/lib/

}

