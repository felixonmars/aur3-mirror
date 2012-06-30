# Contributor: Shaun Ren <shaun.ren@linux.com>

pkgname=emacs-nav
pkgver=49
pkgrel=1
pkgdesc="A lightweight file browser for Emacs"
url="http://code.google.com/p/emacs-nav/"
arch=('any')
license=('GPL3')
depends=('perl')
install=$pkgname.install
source=(http://emacs-nav.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('be6af359e6dd3b1ecb179a6636d60097')

build() {
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/nav
  cp -R $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/emacs/site-lisp/nav
}
