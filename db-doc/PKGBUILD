# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=db-doc
_pkgname=db
pkgver=5.3.28
pkgrel=1
pkgdesc="The Berkeley DB embedded database system - documentation"
arch=('any')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
license=('custom')
depends=("db=$pkgver")
changelog=Changelog
options=(!strip) # it takes a lot of time for nothing
source=("http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz")
sha256sums=('e0a992d740709892e81f9d93f06daf305cf73fb81b545afe72478043172c3628')

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/share/doc/$_pkgname"
    mv docs "$pkgdir/usr/share/doc/$_pkgname"

    install -dm755 "$pkgdir/usr/share/doc/$_pkgname/examples"
    mv examples "$pkgdir/usr/share/doc/$_pkgname"
}
