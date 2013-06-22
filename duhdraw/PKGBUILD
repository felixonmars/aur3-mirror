# $Id: PKGBUILD 9127 2008-08-17 04:01:22Z allan $
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=duhdraw
pkgver=2.8.13
pkgrel=3
pkgdesc="A program which almost perfectly simulates TheDraw for DOS"
arch=('i686' 'x86_64')
depends=('ncurses')
url="http://www.cs.helsinki.fi/u/penberg/duhdraw/"
license=('GPL2')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('70211aa3ea927704ffeb9093e4f433b9')

build() {
  cd $srcdir/$pkgname-$pkgver
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin
  install -m 0755 ansi ansitoc duhdraw $pkgdir/usr/bin
}

# vim: ts=2 sw=2 et ft=sh
