# Maintainer: S. Gilles <stephendgilles@gmail.com>

pkgname=macer
pkgver=1.1
pkgrel=1
pkgdesc="A tiny text-based quick access menu for access management on a publicly visible computer"
arch=('i686', 'x86_64')
url="http://macer.sf.net/"
license=('MIT')
depends=(ncurses)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f189890b4f0c4cdb9b8423f70a85674d')

build() {
  cd $srcdir/$pkgname-$pkgver

  make
  install -dm755 $pkgdir/etc/macer
  install -Dm755 $srcdir/$pkgname-$pkgver/default.macer $pkgdir/etc/macer/
  install -Dm755 $srcdir/$pkgname-$pkgver/macer $pkgdir/usr/bin/macer
}

