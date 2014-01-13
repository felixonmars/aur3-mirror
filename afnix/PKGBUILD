# Maintainer: DavidK <david_king at softhome dot net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=afnix
pkgver=2.4.0
pkgrel=1
pkgdesc="A multi-threaded functional programming language"
arch=('i686' 'x86_64')
url="http://www.afnix.org"
license=('custom')
depends=('ncurses' 'gcc-libs')
source=("http://www.afnix.org/ftp/$pkgname-src-$pkgver.tgz"
        "http://www.afnix.org/ftp/$pkgname-doc-$pkgver.tgz")
md5sums=('00007b75f6831bb1d8a9190df5988da0'
         'a61dbd7fb08377293121eea7a2e06647')
	  
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
  install -D doc/xml/eul/eul.xml "$pkgdir"/usr/share/licenses/afnix/LICENSE
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
