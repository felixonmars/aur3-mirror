# CPAN Name  : B-Lint
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-b-lint/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-b-lint'
pkgver='1.12'
pkgrel='1'
pkgdesc="Perl lint"
arch=('any')
url='http://search.cpan.org/dist/B-Lint'
license=('PerlArtistic' 'GPL')
depends=('perl')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/B-Lint-1.12.tar.gz')
md5sums=('f474580ae4876b1953857a000708950e')

build() {
  DIST_DIR="${srcdir}/B-Lint-1.12"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  {
	cd "$DIST_DIR" &&
    perl Makefile.PL &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

}

