# Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>

pkgname=perl-parse-pidl
pkgver=0.02
pkgrel=1
pkgdesc="Perl/CPAN Module Parse::Pidl : perl IDL compiler"
arch=("any")
url="http://search.cpan.org/~ctrlsoft/Parse-Pidl-$pkgver/pidl"
license=("GPL")
depends=('perl')
source=("http://search.cpan.org/CPAN/authors/id/C/CT/CTRLSOFT/Parse-Pidl-0.02.tar.gz")
md5sums=('cbb1b68a03f33acd2a134180cb058ec8')

build() {
  cd $srcdir/Parse-Pidl-$pkgver
  perl Makefile.PL
  make
}

package() {
  cd $srcdir/Parse-Pidl-$pkgver
  make install DESTDIR=$pkgdir
  rm -r $pkgdir/usr/lib
}
