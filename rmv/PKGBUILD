# Maintainer: Ben Doan <ben at bendoan.me>
pkgname=rmv
pkgver=2.0
pkgrel=1
pkgdesc="Randomly moves files to a directory"
arch=('any')
url="http://github.com/BenDoan/rmv"
license=('MIT')
depends=(python)
provides=("rmv")
source=("https://github.com/BenDoan/rmv/archive/$pkgver.tar.gz")
md5sums=('0dd20dcf7eb2a4b7911070adee81dcf4')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
