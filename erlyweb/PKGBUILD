# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Joachim Fasting <joachim.fasting@gmail.com>
pkgname=erlyweb
pkgver=0.7.1
pkgrel=1
pkgdesc="A component-oriented web development framework for Erlang"
url="http://erlyweb.org/"
arch=('any')
license=('custom')
depends=('erlang')
source=("http://erlyweb.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('76e1b87b0ee4ed7c34e38cc5b6a685b3')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1

  install -D -m644 LICENSE.TXT $pkgdir/usr/share/licences/$pkgname/LICENSE
  install -d $pkgdir/usr/lib/erlang/lib/$pkgname-$pkgver/ebin
  cp ebin/* $pkgdir/usr/lib/erlang/lib/$pkgname-$pkgver/ebin

  install -d $pkgdir/usr/share/doc/$pkgname-$pkgver
  cp doc/* $pkgdir/usr/share/doc/$pkgname-$pkgver
}
