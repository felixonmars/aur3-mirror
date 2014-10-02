# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jonas Jelten <jonas.jelten@gmail.com>

pkgname=wondershaper
pkgver=1.1a
pkgrel=3
pkgdesc="Limit bandwith for surfing at resonable speeds"
arch=('any')
url="http://lartc.org/wondershaper/"
license=('GPL2')
depends=('iproute2')
source=(http://lartc.org/wondershaper/$pkgname-$pkgver.tar.gz)
md5sums=('bbc5a3a4485ab286e337ce8550e7b990')


prepare() {
    cd $srcdir/$pkgname-$pkgver
    #Remove lines that exit because of warning to read the README
    sed -i 25,+4d wshaper
}

package() {
    cd $srcdir/$pkgname-$pkgver

    install -Dm 755 wshaper $pkgdir/usr/bin/$pkgname
    install -Dm 644 README $pkgdir/usr/share/doc/wondershaper/README
}
