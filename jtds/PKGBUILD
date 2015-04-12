# Maintainer: tigrmesh <tigrmesh at aol dot com>
# Contributor: David Langenberg <davel@uchicago.edu>
pkgname=jtds
pkgver=1.3.1
pkgrel=1
pkgdesc="JDBC library for talking to Microsoft SQL Servers"
arch=('i686' 'x86_64')
url="http://jtds.sourceforge.net"
license=('LGPL')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/project/jtds/jtds/$pkgver/$pkgname-$pkgver-dist.zip")
sha256sums=('795d0ff107637ee1d7cd8b2c1fcc878729ee1f40a583b30079c7b6529dd2f4cd')

package() {
  mkdir -p "$pkgdir/usr/share/java/jdbc"
  cp "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/jdbc"
}
