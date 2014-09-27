# Maintainer: Robert Welin
pkgname=scalatest
pkgver=2.2.1
pkgrel=1
pkgdesc="An open-source test framework for the Java Platform"
arch=(any)
url="http://www.scalatest.org/"
license=('Apache')
depends=('java-runtime')
_scalaver=2.11
optdepends=("scala>=$_scalaver")
source=("https://oss.sonatype.org/content/groups/public/org/$pkgname/scalatest_$_scalaver/$pkgver/scalatest_$_scalaver-$pkgver.jar")
noextract=("$_jarname")
package() {
    install -d "$pkgdir/usr/lib/$pkgname"
    install -Dm644 "$srcdir/scalatest_$_scalaver-$pkgver.jar" "$pkgdir/usr/lib/$pkgname/$pkgname.jar"
}
md5sums=('562c139453610c66aff0dac0bc13f192')
