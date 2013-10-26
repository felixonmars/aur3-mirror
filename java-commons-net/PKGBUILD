# Maintainer: Francois Boulogne <fboulogne at april dot org>
_net_name="commons-net"
pkgname=java-$_net_name
pkgver=3.3
pkgrel=1
pkgdesc='Implementations of common net'
arch=('i686' 'x86_64')
url='http://commons.apache.org/net/'
license=('APACHE')
depends=('java-runtime')
makedepends=('maven')
source=("http://apache.mirrors.tds.net/commons/net/source/$_net_name-$pkgver-src.tar.gz")
md5sums=('da5ea06adff7edd0db318605896c7c8e')

build() {
	cd $srcdir/$_net_name-$pkgver-src/
	mvn package
}	

package() {
	cd $srcdir/$_net_name-$pkgver-src/target/

	install -d -m755 ${pkgdir}/usr/share/java/$_net_name/ || return 1
	
	install -m644 ${srcdir}/$_net_name-$pkgver-src/target/$_net_name-$pkgver.jar \
		$pkgdir/usr/share/java/$_net_name/$_net_name.jar || return 1
}

# vim:set ts=2 sw=2:
