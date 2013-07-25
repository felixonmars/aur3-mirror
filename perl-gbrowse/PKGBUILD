# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-gbrowse'
pkgver='2.55'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-bio-graphics>=2.34' 'perl-bioperl' 'perl-capture-tiny' 'perl-cgi-session>=4.02' 'perl-gd>=2.07' 'perl-io-string' 'perl-json' 'perl-libwww' 'perl-statistics-descriptive' 'perl-term-readkey' 'perl-timedate')
makedepends=()
url='http://search.cpan.org/dist/GBrowse'
source=('http://search.cpan.org/CPAN/authors/id/L/LD/LDS/GBrowse-2.55.tar.gz')
md5sums=('5ab441eb2f0fa096d37c837c8968b229')
sha512sums=('1e9b883cbacc0fc0f143c2e70c73a4b75ca60cf213068d983aab75b37c1db514f8bb4f14d15a5158fe180b3a9b571a4dc8fc4d838d1ff04bb46cd9ff16abccc9')
_distdir="GBrowse-2.55"

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
