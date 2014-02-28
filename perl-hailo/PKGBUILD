# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-hailo'
pkgver='0.72'
pkgrel='1'
pkgdesc="A pluggable Markov engine analogous to MegaHAL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-moose>=0.13' 'perl-bot-training>=0' 'perl-bot-training-megahal>=0' 'perl-bot-training-starcraft>=0' 'perl-class-load>=0.06' 'perl-dbd-sqlite>=1.29' 'perl-data-dump>=1.17' 'perl-data-section>=0.101620' 'perl-dir-self>=0.10' 'perl-file-countlines>=0' 'perl-file-slurp>=9999.13' 'perl-getopt-long-descriptive>=0.085' 'perl-io-interactive>=0' 'perl-ipc-system-simple>=1.21' 'perl-list-moreutils>=0.22' 'perl-moose>=1.08' 'perl-moosex-getopt>=0.37' 'perl-moosex-strictconstructor>=0.16' 'perl-mouse>=0.62' 'perl-mousex-getopt>=0.33' 'perl-mousex-strictconstructor>=0.02' 'perl-regexp-common>=2010010201' 'perl-term-sk>=0.06' 'perl-namespace-clean>=0.18')
makedepends=()
checkdepends=('perl-test-exception>=0.29' 'perl-test-expect>=0.31' 'perl-test-output>=0.16' 'perl-test-script>=1.07' 'perl-test-script-run>=0.04' 'perl-test-synopsis>=0.06')
url='http://search.cpan.org/dist/Hailo'
source=('http://search.cpan.org/CPAN/authors/id/A/AV/AVAR/Hailo-0.72.tar.gz')
md5sums=('99a06dc9bb51913ad0214da4158a720a')
sha512sums=('5c7de5cddcd140e1805f9172a1b64f31d3016aec5377070121401656e1565ef66b393f9f2edea6f2d2a20e61022a3235cd2493bfc103737767983fff99bf67ef')
_distdir="Hailo-0.72"

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
