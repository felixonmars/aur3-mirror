
# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=emacs-link-grammar-svn
pkgver=51
pkgrel=2
pkgdesc="An english grammar checker mode for Emacs based on link-grammar (subversion)"
arch=('i686' 'x86_64')
url="http://www.emacswiki.org/emacs/BaoqiuCui#toc2"
license=('GPL')
makedepends=('emacs' 'subversion' 'gcc')
depends=('link-grammar')

source=('emacs-link-grammar-svn.install')
install='emacs-link-grammar-svn.install'
md5sums=('7a140d52fab9c6fcb0a03002118ed71c')

build() {
  cd "$srcdir"
  svn co -r 51 http://bcui-emacs.googlecode.com/svn/trunk/grammar
  cd grammar

  mkdir -p "$pkgdir/usr/bin" || return 1
  g++ -O2 -llink-grammar -I/usr/include/link-grammar grammar.cc -o "$pkgdir/usr/bin/grammar" || return 1
  emacs -batch -f batch-byte-compile grammar.el || return 1

  mkdir -p "$pkgdir/usr/share/emacs/site-lisp" || return 1
  cp grammar.el{c,} "$pkgdir/usr/share/emacs/site-lisp/" || return 1
}

