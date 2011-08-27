# Maintainer: Peter Lewis <pete@muddygoat.org>
# Contributor: Bartlomiej Palmowski (Rotwang), maks1k at wp dot pl
# Contributor: Łukasz Fidosz (virhilo), virhilo at gmail dot com

pkgname=tornado
pkgver=1.4
pkgrel=2
pkgdesc="clone of a C64 game, goal of the game is to destroy the opponent's house with certain weather phenomena"
arch=('i686' 'x86_64')
license=('GPL')
url=("http://kiza.kcore.de/software/tornado/")
source=(http://kiza.kcore.de/software/$pkgname/download/$pkgname-$pkgver.tar.gz)
md5sums=('2367919d184bf4c131c208b5e762e036')
depends=('ncurses')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make tornado tornado.6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0644 doc/man/tornado.6 "$pkgdir/usr/share/man6/tornado.6"
  install -D -m 0755 tornado "$pkgdir/usr/bin/tornado"
}

