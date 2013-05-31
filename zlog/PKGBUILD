# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Chase Geigle <sky@skystrife.com>

pkgname=zlog
pkgver=53958428
pkgrel=1
pkgdesc="A flexible, fast, and thread-safe logger for C"
arch=('i686' 'x86_64')
url="http://hardysimpson.github.io/zlog/"
license=('GPLv3')
provides=('zlog')
conflicts=('zlog')
source=(https://hardysimpson-zlog.googlecode.com/files/$pkgname-latest-stable-$pkgver.tar.gz)
sha1sums=('7ce2623b094062fecd9db093d3e206d1e0bc4f0f')

build() {
  cd "${srcdir}/${pkgname}-latest-stable-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-latest-stable-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
}
