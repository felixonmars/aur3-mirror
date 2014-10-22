
# Maintainer: Henry J. Wylde <accounts+aur at hjwylde dot com>

pkgname=wdk-src
pkgver=0.3.31
pkgrel=1
pkgdesc="Whiley Development Kit - Source files"
arch=('any')
url="http://whiley.org/"
license=('BSD')
source=("http://whiley.org/download/wdk/wdk-src-v$pkgver.tgz")
md5sums=('e7deb719d99c4477dc80e2aad8c8187c')

package() {
    _wdk_pkgname=wdk
    cd "$srcdir/$_wdk_pkgname-v$pkgver"

    mkdir -p "$pkgdir/usr/lib/$_wdk_pkgname/"
    cp -ar examples "$pkgdir/usr/lib/$_wdk_pkgname/"
    cp -ar modules "$pkgdir/usr/lib/$_wdk_pkgname/"
    cp -ar tests "$pkgdir/usr/lib/$_wdk_pkgname/"

    install -Dm644 CONTRIBUTORS "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTORS"
    install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

