# Maintainer: Henning Bekel <h.bekel@googlemail.com>

pkgname=dictem
pkgver=1.0.2
pkgrel=1
pkgdesc="Dictionary client for Emacs"
arch=('any')
url="http://sourceforge.net/projects/dictem"
license=('GPL2')
depends=('emacs')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('42a66869333cf69d931eadca1301709d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m644 -D dictem.el $pkgdir/usr/share/emacs/site-lisp/dictem.el
  install -m644 -D README $pkgdir/usr/share/doc/dictem/README
}

# vim:set ts=2 sw=2 et:

