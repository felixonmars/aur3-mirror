# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-datetime-format-cldr'
pkgver='1.15'
pkgrel='1'
pkgdesc="Parse and format CLDR time patterns"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.48' 'perl-datetime-incomplete>=0' 'perl-datetime-locale>=0.42' 'perl-datetime-timezone>=0.95' 'perl-params-validate>=0.76' 'perl>=5.8.0')
makedepends=()
checkdepends=('perl-test-exception>=0' 'perl-test-nowarnings>=0' 'perl-test-warn>=0')
url='https://metacpan.org/release/DateTime-Format-CLDR'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAROS/DateTime-Format-CLDR-1.15.tar.gz')
md5sums=('ac3af5dc693c0223ad310d270c46606f')
sha512sums=('9fd0d7f4bb63a1c7b22bb759b9e97c21c141289f1a969fa4dd314d9a75b0773f0ddcb142e016dd35cba891910a15605a22108e5ea9ee5f38f3e952f16f9269b0')
_distdir="DateTime-Format-CLDR-1.15"

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
