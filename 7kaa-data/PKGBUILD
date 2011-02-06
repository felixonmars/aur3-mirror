# Contributor: xnitropl <xnitropl at gmail dot com>
pkgname=7kaa-data
pkgver=2.13
pkgrel=1
pkgdesc="Seven Kingdoms: Ancient Adversaries data."
url="http://7kfans.com/"
arch=('any')
license=('GPL')
depends=('7kaa')
source=(http://netcologne.dl.sourceforge.net/project/skfans/Seven%20Kingdoms%20AA%20Data%20Files/$pkgname-$pkgver.tar.bz2)
md5sums=('d7580a683fabcea98b5898dff252dcf2')

build() {
  mkdir -p $pkgdir/opt/7kaa
  cp -r $srcdir/7kaa/* $pkgdir/opt/7kaa

  install -D -m644 $pkgdir/opt/7kaa/COPYING $pkgdir/usr/share/doc/7kaa/COPYING
  install -D -m644 $pkgdir/opt/7kaa/README-GameData $pkgdir/usr/share/doc/7kaa/README-GameData
}
# vim:set ts=2 sw=2 et:
