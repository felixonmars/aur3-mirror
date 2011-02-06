# CPAN Name  : Class-MOP
# Contributor: AUR Perl <aurperl@juster.info>
# Generator  : CPANPLUS::Dist::Arch 1.10
pkgname='perl-class-mop'
pkgver='1.12'
pkgrel='1'
pkgdesc="A Meta Object Protocol for Perl 5"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-optlist' 'perl-devel-globaldestruction' 'perl-list-moreutils>=0.12' 'perl-mro-compat>=0.05' 'perl-package-deprecationmanager>=0.10' 'perl-package-stash>=0.13' 'perl-sub-name>=0.04' 'perl-task-weaken' 'perl-try-tiny>=0.02')
makedepends=('perl-test-fatal>=0.001' 'perl-test-requires>=0.05')
url='http://search.cpan.org/dist/Class-MOP'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Class-MOP-1.12.tar.gz')
md5sums=('685edbc1f388362f48ec67701b67acf6')

build() {
  PERL=/usr/bin/perl
  DIST_DIR="${srcdir}/Class-MOP-1.12"
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
