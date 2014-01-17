# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=lebiniou-data
pkgver=3.10
pkgrel=1
pkgdesc="A program which creates images from sound, in an intelligent way. Data files."
arch=(any)
url="http://biniou.net/"
license=('GPL')
source=("http://dl.biniou.net/biniou/tar/$pkgname-$pkgver.tar.gz")
md5sums=('a0a992a91bb2e536b26dc45c67d81d7c')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
