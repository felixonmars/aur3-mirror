# CPAN Name  : HTML-FormHandler-Model-DBIC
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-html-formhandler-model-dbic/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-html-formhandler-model-dbic'
pkgver='0.12'
pkgrel='1'
pkgdesc="Model class for FormHandler using DBIx::Class"
arch=('any')
url='http://search.cpan.org/dist/HTML-FormHandler-Model-DBIC'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-datetime-format-mysql' 'perl-datetime-format-sqlite' 'perl-datetime-format-w3cdtf' 'perl-dbix-class' 'perl-dbix-class-resultset-recursiveupdate>=0.012' 'perl-html-formhandler>=0.32000' 'perl-moose>=0.90' 'perl-namespace-autoclean>=0.09')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/G/GS/GSHANK/HTML-FormHandler-Model-DBIC-0.12.tar.gz')
md5sums=('fef05877ca9e7a089897f10f5a9afa47')

build() {
  DIST_DIR="${srcdir}/HTML-FormHandler-Model-DBIC-0.12"
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
