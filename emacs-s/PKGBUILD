# Author: Sebastien Duthil <duthils@free.fr>

pkgname=emacs-s
pkgver=1.9.0
pkgrel=2
pkgdesc='The long lost Emacs string manipulation library'
arch=('any')
url="https://github.com/magnars/s.el"
license=('GPL')
makedepends=('emacs')
depends=('emacs')
source=("https://github.com/magnars/s.el/archive/$pkgver.tar.gz")
md5sums=('c5b936d05efe617caafb82a18f952c1e')

build() {
  cd "s.el-$pkgver"

  # byte compile
  emacs -batch -f batch-byte-compile s.el
}

package() {
  install -d "$pkgdir/usr/share/emacs/site-lisp/s"
  install -Dm644 "$srcdir/s.el-$pkgver/"*.{el,elc} "$pkgdir/usr/share/emacs/site-lisp/s"
}
