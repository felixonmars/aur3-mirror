# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-string-flogger'
pkgver='1.101244'
pkgrel='1'
pkgdesc="string munging for loggers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=0' 'perl-params-util>=0' 'perl-sub-exporter>=0')
makedepends=()
url='http://search.cpan.org/dist/String-Flogger'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/String-Flogger-1.101244.tar.gz')
md5sums=('27615e8c00b76b2a9b11c1cfa65beb54')
sha512sums=('6661d668f7ad94f105c1c560177dba869041fbf6900eff8ec2b67adc08aecf72e0ffeb81cc4912e3811a236d373b825bf545a638cb168911f64b57b73d7980dd')
_distdir="String-Flogger-1.101244"

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
