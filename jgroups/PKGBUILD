# Maintainer: Revolt <revolt at inbox dot com>

pkgname=jgroups
pkgver=3.4.1.Final
pkgrel=1
pkgdesc="Java toolkit for reliable multicast communication via a flexible protocol stack"
url="http://www.jgroups.org/"
license=('(L)GPL2')
arch=(i686 x86_64)
depends=('java-runtime')
source=(http://downloads.sourceforge.net/project/javagroups/JGroups/$pkgver/$pkgname-$pkgver.jar)

md5sums=('48390b91b3b10c33ee92a81e30a77597')

package() {
    mkdir -p $pkgdir/usr/share/java/
    cp $srcdir/$pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname.jar
}
