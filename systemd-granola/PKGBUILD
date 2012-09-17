# Maintainer: Limao Luo <luolimao@gmail.com>
# Contributor: Alucryd <alucryd@gmail.com>

pkgname=systemd-granola
pkgver=1.0
pkgrel=4
pkgdesc="Systemd integration for granola"
arch=(any)
url=http://grano.la
license=(GPL3)
depends=(granola)
install=systemd.install
source=(granola.conf granola.service granola-connect.service)
sha256sums=('5065ac37c32a6f1af9d9368fee574ad6f2985106428c265a773d0080ce5642fb'
    '065bd736a9e10c313ae973c3a2a55754dd28a54e24025a6e6d410fb786b2eedf'
    '25da5de8565f0da78c5ad0e67d313eb58a91c3b5bc168f1fbecbc7939fffdad0')
sha512sums=('0b524fc74fce5322bb2adbf5b5eff9e16c2ef835dcb1e8489ea9fc7c4b9b236cc7c47d14be60c19d381d259eb4001d6c3183c13c13a72461a2214776309cd330'
    '7b31257968edb418a2297695828506c717e12f64a1f1d458c04941fa10293eee668ae1498900cd09c800af33bded63f6ab01e81c94f08c3077986207aeec6304'
    '9f44a8e15850d2d16542d25aafa6cb5b16bd1854b276df7dbf5ce714cb268f0aa53f8e2f3ed8000bf5752550bf90ed01aaf1cca9707b64d53353c6f6fef02f93')

package() {
    cd "$srcdir"
    install -Dm644 granola.conf "$pkgdir"/etc/modules-load.d/granola.conf
    install -Dm644 granola.service "$pkgdir"/etc/systemd/system/granola.service
    install -Dm644 granola-connect.service "$pkgdir"/etc/systemd/system/granola-connect.service
}
