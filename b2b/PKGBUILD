# Maintainer: Jake Forsberg <iorbit.earth gmail com>
pkgname=b2b
pkgver=1.0
pkgrel=1
pkgdesc="Perform simple base number conversions on the command line"
url="https://github.com/iorbitearth/b2b"
license=('GPL')
arch=('any')
depends=('bc')
source="https://github.com/iorbitearth/${pkgname}/archive/v${pkgver}.tar.gz"
md5sums=('14838e98a3f186d15499a0efa014e47c')

package() {
    mkdir -p "$pkgdir/usr/bin"
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/usr/bin" install
}
