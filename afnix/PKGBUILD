# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=afnix
pkgver=2.2.0
_pkgver=2-2-0
pkgrel=1
pkgdesc="A multi-threaded functional programming language"
arch=('i686' 'x86_64')
url="http://www.afnix.org"
license=('custom')
depends=('ncurses' 'gcc-libs')
source=(http://www.afnix.org/ftp/$pkgname-src-$_pkgver.tgz COPYING)
sha1sums=('0489398a7cbcfd844086ad6cba5b935452a0eede'
          'cd460fd2067e9572f47f378afa3076c0da76bc70')
	  
build() {
  cd $srcdir/$pkgname-src-$_pkgver
  ./cnf/bin/afnix-setup -o --prefix=$pkgdir/usr
  make status
  make
  make ETCDIR=$pkgdir/etc/afnix install
  cd $srcdir/$pkgname-src-$_pkgver/doc
  make
  install -d  $pkgdir/usr/man/man7
  #install xml/vol/vol-?/*.7 -t $pkgdir/usr/man/man7 #doesn't exist
  cd $srcdir
  install -D COPYING $pkgdir/usr/share/licenses/afnix/COPYING
}
