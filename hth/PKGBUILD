# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=hth
pkgver=0.2
pkgrel=1
pkgdesc='A two-player board game where the goal is to capture opponent pieces'
arch=('i686' 'x86_64')
url="http://www.interq.or.jp/libra/oohara/hth/"
license=('zlib')
depends=('ncurses')
source=("http://www.interq.or.jp/libra/oohara/hth/hth-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/hth-${pkgver}"
	make
}

package() {
	cd "${srcdir}/hth-${pkgver}"
	install -Dm755 hth "${pkgdir}/usr/bin/hth"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

md5sums=('a25034ec7454c69598d032fb33cf3c6a')
