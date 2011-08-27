# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Carol Alexandru <shapeshifter at archlinux dot us>
pkgname=cmatrixreloaded
pkgver=0.01
pkgrel=1
pkgdesc="I don't even see the code. All I see is blonde, brunette, readhead"
arch=('i686' 'x86_64')
license=('BSD')
url=(http://i.imgur.com/Ceec9.jpg)
depends=(ncurses)
source=(http://login.icu.uzh.ch/~archer/$pkgname-$pkgver.tar.gz)
md5sums=('477a22395937387258539524e1f43a24')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gcc -std=gnu99 cmatrixreloaded.c -lncurses -o cmatrixreloaded
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin/"
  cp cmatrixreloaded "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
