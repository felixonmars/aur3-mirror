# Maintainer: DavidK <david_king at softhome dot net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=afnix
pkgver=2.3.1
pkgrel=1
pkgdesc="A multi-threaded functional programming language"
arch=('i686' 'x86_64')
url="http://www.afnix.org"
license=('custom')
depends=('ncurses' 'gcc-libs')
source=(http://www.afnix.org/ftp/$pkgname-src-$pkgver.tgz 
        http://www.afnix.org/ftp/$pkgname-doc-$pkgver.tgz 
        COPYING)
md5sums=('341dd886dc5d14849ee579f2e5cbcfb1'
         'e14cdf474cf4571468a0cec334071e47'
         'd4e14e1318d06b9cdef3dfa2aedd9cf2')
	  
build() {
  cd "$srcdir"/$pkgname-src-$pkgver
  ./cnf/bin/afnix-setup -o --prefix=$pkgdir/usr
  make status
  make
}

package() {
  cd "$srcdir"/$pkgname-src-$pkgver
  make install
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install etc/*.el -t "$pkgdir"/usr/share/emacs/site-lisp
  cd "$srcdir"
  install -D COPYING "$pkgdir"/usr/share/licenses/afnix/COPYING
  cd "$srcdir"/$pkgname-doc-$pkgver
  install -d "$pkgdir"/usr/share/man/man1
  install -d "$pkgdir"/usr/share/man/man3
  install -d "$pkgdir"/usr/share/man/man7
  install man/*.1 -t "$pkgdir"/usr/share/man/man1
  install man/*.3 -t "$pkgdir"/usr/share/man/man3
  install man/*.7 -t "$pkgdir"/usr/share/man/man7
  install -d "$pkgdir"/usr/share/doc/afnix
  install xht/* -t "$pkgdir"/usr/share/doc/afnix
}
