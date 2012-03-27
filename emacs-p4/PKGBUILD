# Maintainer: Jonathan Arnold <jdarnold@buddydog.org>
pkgname=emacs-p4
pkgver=10.6
pkgrel=5
pkgdesc="Integrates Perforce SCM with Emacs."
url="http://p4el.sourceforge.net/"
arch=('any')
license=('GPL')
depends=('emacs' 'p4')
elispname=p4
install=$pkgname.install

source=(http://sourceforge.net/projects/p4el/files/p4el/$pkgver/p4.el-$pkgver.tgz/download)
md5sums=('d1b68df015339e7c31b69deff9154bfa')

build() {
  cd $startdir/src/
  emacs -batch -Q -f batch-byte-compile $elispname.el >& /dev/null

  install -d $pkgdir/usr/share/emacs/site-lisp/
  install -Dm644 $srcdir/$elispname.el{,c} $pkgdir/usr/share/emacs/site-lisp/
}
