# Contributor: Link Dupont <link.dupont@gmail.com>
# Maintainer: Link Dupont <link.dupont@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.06
pkgname='perl-schedule-cron-events'
pkgver='1.9'
pkgrel='1'
pkgdesc="take a line from a crontab and find out when events will occur"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-set-crontab')
url='http://search.cpan.org/dist/Schedule-Cron-Events'
source=("http://search.cpan.org/CPAN/authors/id/K/KO/KOHTS/Schedule-Cron-Events-${pkgver}.tar.gz")
md5sums=('5ead7d08311f50a73649361ee6f61dc9')

build() {
  PERL=/usr/bin/perl
  DIST_DIR="${srcdir}/Schedule-Cron-Events-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { cd "$DIST_DIR" &&
    $PERL Makefile.PL &&
    make &&
    make test &&
    make install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
