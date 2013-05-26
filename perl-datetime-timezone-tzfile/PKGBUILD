# Contributor: Mateusz Krasowski <matkras@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetime-timezone-tzfile'
pkgver='0.007'
pkgrel='1'
pkgdesc="tzfile (zoneinfo) timezone files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-date-iso8601' 'perl-datetime-timezone-systemv>=0.002' 'perl-params-classify')
makedepends=()
url='http://search.cpan.org/dist/DateTime-TimeZone-Tzfile'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/DateTime-TimeZone-Tzfile-0.007.tar.gz')
md5sums=('7894cb31decfb83b4f3f4f783b871839')
sha512sums=('e8afd43677552c01df8a4f77614865c328e6f185825f2a7bc89dffd8efc4acb1f69d925187ab85fe6a5644bab706d59d5e34be1dae74c23c720da0706d2cc491')
_distdir="DateTime-TimeZone-Tzfile-0.007"

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
