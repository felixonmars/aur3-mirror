# Maintainer: Vladimir Tsanev <tsachev@gmail.com>

pkgname=java-commapi
pkgver=3.0u1
pkgrel=1
pkgdesc="Java Communications 3.0 API"
arch=('any')
url="http://java.sun.com/products/javacomm/index.jsp"
depends=('java-runtime')
license=('custom')
source=(http://download.oracle.com/otn-pub/java/JAVACOMM/3.0/3.0upd/comm3.0_linux.zip)

DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')

package() {
    mkdir -p $pkgdir/usr/share/{java/commapi,licenses/$pkgname}
    cd $srcdir/commapi
    install -m 644 jar/comm.jar $pkgdir/usr/share/java/commapi
    install -m 644 docs/license.txt $pkgdir/usr/share/licenses/$pkgname
}

md5sums=('5f2d88b2bf6f1769cdb3c1ea04c1f634')
sha256sums=('e82336ee146339ea569c7cb2b121bd68b37076e4291e79d95f1714a4b6c1d1fd')
