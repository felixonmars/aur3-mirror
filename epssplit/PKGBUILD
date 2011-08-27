# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
pkgname=epssplit
pkgver=1.1.0
pkgrel=1
pkgdesc="The perl program for splitting an EPS file into several smaller EPS files."
arch=(any)
url="http://home.clara.net/nox/software/epssplit/"
license=('GPL')
depends=('perl>=5.0')

source=(http://home.clara.net/nox/software/$pkgname/$pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  pod2man -r "$pkgname $pkgver" -c '' devel/epssplit.pod | gzip -9 > epssplit.1.gz

  _perldir="/usr/share/perl5/vendor_perl/"
  _docdir="/usr/share/doc/$pkgname/"
  _bindir="/usr/bin/"
  _mandir="/usr/share/man/man1/"

  install -d -m 755 $pkgdir$_perldir
  install -d -m 755 $pkgdir$_docdir
  install -d -m 755 $pkgdir$_bindir
  install -d -m 755 $pkgdir$_docdir/html

  install -m 644 *.pm           $pkgdir/$_perldir
  install -m 755 epssplit       $pkgdir/$_bindir
  install -m 644 README         $pkgdir/$_docdir
  install -m 644 doc-html-png/* $pkgdir/$_docdir/html

  install -m 644 -D epssplit.1.gz $pkgdir/$_mandir/epssplit.1.gz
}

md5sums=('1b9342ddef8887e2f7f26906b809480d')
