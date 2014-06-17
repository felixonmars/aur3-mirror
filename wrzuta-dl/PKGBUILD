# Maintainer: Krystian Dużyński <krystian.duzynski at gmail.com>
pkgname=wrzuta-dl
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="A small command-line script to download music from wrzuta.pl"
arch=('any')
url="http://krystiand.net/aur/wrzuta-dl.html"
license=('GPL')
depends=('python>=3')
source=(.AURINFO wrzuta-dl)

package() {
	cd "$srcdir"
	install -Dm755 wrzuta-dl "${pkgdir}/usr/bin/wrzuta-dl"
}
md5sums=('fa9b53e880bee0a6aae187b643b96c22'
         '3688130250023b3ad6bb94a2ddfd1804')
