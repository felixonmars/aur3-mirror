pkgname=java-guava
_shortname=guava
pkgver=18.0
pkgrel=1
pkgdesc="Google's core Java libraries"
arch=(any)
url='http://code.google.com/p/guava-libraries/'
license=('Apache')
depends=('java-runtime>=6')
source=("https://search.maven.org/remotecontent?filepath=com/google/guava/$_shortname/$pkgver/$_shortname-$pkgver.jar")
noextract=("$_shortname-$pkgver.jar")
sha512sums=('c84ad9f1646b52b6e19f55c3c63936c6dbe59597d53cec6855f85e21ad26f9bc27b0c541b793fab117e2359b1bf3fcd59b222255345fce858bc03cc48cbffd65')

package() {
    install -Dm644 "$srcdir/$_shortname-$pkgver.jar" "$pkgdir/usr/share/java/$_shortname/$_shortname.jar"
}
