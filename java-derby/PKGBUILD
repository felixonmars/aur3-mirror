pkgname=java-derby
_tarname=db-derby
_dirname=derby
pkgver=10.11.1.1
pkgrel=1
pkgdesc="An open source relational database implemented entirely in Java, from Apache DB"
arch=(any)
url='http://db.apache.org/derby/'
license=('Apache')
depends=('java-runtime')
source=("http://ftp.ps.pl/pub/apache//db/derby/$_tarname-$pkgver/$_tarname-$pkgver-lib.tar.gz")
sha512sums=('5ef91617f0a7b5175b7877fd3aeedabf7b0d46d8d019144e49a7d24cc21c44399e82bf12b81f3943b309cd240031363e5efd7edbf47d4e672afecafb869e9b7a')

package() {
    cd "$srcdir/$_tarname-$pkgver-lib/lib"
    mkdir -p "$pkgdir/usr/share/java/$_dirname"
    install -Dm644 *.jar "$pkgdir/usr/share/java/$_dirname/"
    install -Dm644 *.war "$pkgdir/usr/share/java/$_dirname/"
}
