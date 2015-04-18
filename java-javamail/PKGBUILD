pkgname=java-javamail
_dirname=javamail
_jarname=javax.mail
pkgver=1.5.3
pkgrel=1
pkgdesc="Oracle's implementation of JSR-919."
arch=(any)
url='https://java.net/projects/javamail/pages/Home'
license=('GPL2')
depends=('java-runtime')
source=("https://maven.java.net/content/repositories/releases/com/sun/mail/$_jarname/$pkgver/$_jarname-$pkgver.jar")
noextract=("$_jarname-$pkgver.jar")
sha512sums=('04ab2485ccaf95be3d8a6e61b9ed84dec1e28c7a740d394d5c207f69d42503b57e3b8ddb13c9edb32212979912a248829092d222627ffad5c99ae0a897907e31')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/java/$_dirname"
    install -Dm644 "$_jarname-$pkgver.jar" "$pkgdir/usr/share/java/$_dirname/"
}
