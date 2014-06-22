# Maintainer: jsteel <jsteel at aur.archlinux.org>

pkgname='perl-excel-template'
_pkgname='Excel-Template'
pkgver='0.34'
pkgrel='1'
pkgdesc="Layout system to use the data structure from HTML::Template and create a Microsoft Excel file"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser' 'perl-spreadsheet-writeexcel')
url="http://search.cpan.org/dist/$_pkgname"
source=(http://search.cpan.org/CPAN/authors/id/R/RB/RBO/$_pkgname-$pkgver.tar.gz)
md5sums=('7104cdc2df0fb981e4c929679f321805')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir"/$_pkgname-$pkgver

    /usr/bin/perl Makefile.PL

    make
  )
}

check() {
  cd "$srcdir"/$_pkgname-$pkgver

  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver

  make install
}
