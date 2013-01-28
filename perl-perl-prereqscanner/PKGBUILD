# Maintainer : Konrad Borowski <glitchmr@myopera.com>
# CPAN Name  : Perl-PrereqScanner
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04

pkgname='perl-perl-prereqscanner'
pkgver='1.015'
pkgrel='1'
pkgdesc="a tool to scan your Perl code for its prerequisites"
arch=('any')
url='http://search.cpan.org/dist/Perl-PrereqScanner'
license=('PerlArtistic' 'GPL')
depends=('perl-cpan-meta-requirements'
'perl-list-moreutils'
'perl-moose'
'perl-ppi>=1.215'
'perl-params-util'
'perl-string-rewriteprefix>=0.005'
'perl-namespace-autoclean'
'perl>=5.008')

options=('!emptydirs')

source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Perl-PrereqScanner-$pkgver.tar.gz")
md5sums=('339b795952e83ebc7ec68ed107fe9ca9')

build() {
  DIST_DIR="${srcdir}/Perl-PrereqScanner-$pkgver"
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
