pkgname=java-commons-configuration
_shortname=commons-configuration
pkgver=1.10
pkgrel=1
pkgdesc='A generic configuration interface for Java.'
arch=('any')
url='http://commons.apache.org/proper/commons-configuration/'
license=('Apache')
depends=('java-runtime>=5')
source=("http://repo1.maven.org/maven2/$_shortname/$_shortname/$pkgver/$_shortname-$pkgver.jar")
noextract=("$_shortname-$pkgver.jar")
md5sums=('b16511ce540fefd53981245f5f21c5f8')

package() {
    install -Dm755 "$srcdir/$_shortname-$pkgver.jar" "$pkgdir/usr/share/java/$_shortname/$_shortname.jar"
}
