# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-versor  
pkgver=1.12
pkgrel=3
pkgdesc="Versatile Cursors for GNUemacs"
url="http://emacs-versor.sourceforge.net/"
arch=('any')
license=('GPL')
depends=('emacs')
makedepends=('texinfo' 'texlive-core')
install=versor.install
source=(http://downloads.sourceforge.net/emacs-versor/emacs-versor-1.12.tar.gz \
versor.info.patch languide.info.patch)
md5sums=('27ed52001ef00f37d016977159788fb3' '9eb91363aa9f716bd34fa4351529e7d0'\
         'a654f088a8b0567a1d5ce823db471da1')
options=('docs')

build() {
  install -d $pkgdir/usr/share/doc/$pkgname || return 1
  install -d $pkgdir/usr/share/emacs/site-lisp/$pkgname || return 1
  cd $srcdir/$pkgname/demo
  cp * $pkgdir/usr/share/doc/$pkgname || return 1
  cd $srcdir/$pkgname/lisp
  for _i in *.el 
  do
    emacs -batch -q -no-site-file -no-init-file -f batch-byte-compile ${_i}
    install -m644 ${_i} $pkgdir/usr/share/emacs/site-lisp/$pkgname || return 1  
  done
  for _i in *.elc 
  do
    install -m644 ${_i} $pkgdir/usr/share/emacs/site-lisp/$pkgname || return 1
  done
  cd $srcdir/$pkgname/texinfo 
  patch versor.info ../../versor.info.patch || return 1
  patch languide.info ../../languide.info.patch || return 1
  install -Dm644 versor.info $pkgdir/usr/share/info/versor.info || return 1
  install -Dm644 languide.info $pkgdir/usr/share/info/languide.info || return 1
}
