# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-exception-class-dbi'
pkgver='1.01'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=1.28' 'perl-exception-class>=1.02')
makedepends=()
url='http://search.cpan.org/dist/Exception-Class-DBI'
source=('http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/Exception-Class-DBI-1.01.tar.gz')
md5sums=('370f8ff528971102a760496866bea0d0')
sha512sums=('d40c1c9d972ab81acd2c8fe748cf7fec9cf9eab2898d81faeef55a6daab962d256a15a98a2e6279ec8367738f3e8fee71b80e722cd72daa162c5a3f9e428eff5')
_distdir="Exception-Class-DBI-1.01"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
