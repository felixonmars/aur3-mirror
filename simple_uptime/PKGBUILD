# Maintainer: Ryan Jacobs <ryan.mjacobs@gmail.com>
pkgname=simple_uptime
pkgver=1.4
pkgrel=1
pkgdesc="A fast, simple uptime command for Linux."
arch=('any')
url="https://github.com/ryanmjacobs/simple_uptime"
license=('MIT')
options=('strip' 'zipman')
changelog=ChangeLog
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('d050a9b427dce19188a1983773798c84')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 0775 ${pkgname} ${pkgdir}/usr/bin/$pkgname
}
