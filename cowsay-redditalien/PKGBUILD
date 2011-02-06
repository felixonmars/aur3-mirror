# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=cowsay-redditalien
pkgver=2
pkgrel=1
pkgdesc="Use the reddit alien in cowsay"
arch=('any')
url="http://www.nog.net/~tony/warez/cowsay.shtml"
license=('CCPL')
depends=('cowsay')
source=(https://dl.getdropbox.com/u/1720529/redditaliencowsay.tar.gz)
md5sums=('9eca2cc8c4a9bf169287195f61725ae2')

build() {
  # Shortest PKGBUILD EVAR!
  install -Dm644 ${srcdir}/redditaliencowsay/redditalien.cow ${pkgdir}/usr/share/cows/redditalien.cow
}
