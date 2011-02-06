# Maintainer: Thomas Dahms <thdahms (at) gmx (dot) de>

pkgname=pullandmake
pkgver=0.1
pkgrel=1
pkgdesc="Maybe the simplest tool to pull packages from AUR and build them. Without any unneeded features."
arch=('any')
url="http://skwillt.wordpress.org"
license=('MIT')
depends=('bash')
source=(pullandmake LICENSE)
md5sums=('120b438ee997e4f443cfac4d59053a70'
         '53644e9dc0273f56ffbb67de73b1af24')

build() {
    install -Dm 755 pullandmake $pkgdir/usr/bin/pullandmake
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
