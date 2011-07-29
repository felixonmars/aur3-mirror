# Contributor: xnitropl <xnitropl at gmail dot com>
# Contributor: diffycat

pkgname=7kaa-data
pkgver=2.13
pkgrel=2
pkgdesc="Free data set for Seven Kingdoms: Ancient Adversaries"
url='http://7kfans.com/'
arch=('any')
license=('GPL')
depends=('7kaa')
source=("http://downloads.sourceforge.net/project/skfans/Seven%20Kingdoms%20AA%20Data%20Files/$pkgname-$pkgver.tar.bz2")
md5sums=('d7580a683fabcea98b5898dff252dcf2')

build() {
  install -dm755 "${pkgdir}/opt/7kaa/"
  cp -r ${srcdir}/7kaa/* "${pkgdir}/opt/7kaa/"
  install -D -m644 "${srcdir}/7kaa/README-GameData" "${pkgdir}/usr/share/doc/${pkgname}/README-GameData"
}

# vim:set ts=2 sw=2 et:


