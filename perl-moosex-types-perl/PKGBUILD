# Maintainer : Konrad Borowski <glitchmr@myopera.com>
# CPAN Name  : MooseX-Types-Perl
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.00

pkgname='perl-moosex-types-perl'
pkgver='0.101341'
pkgrel='1'
pkgdesc="Moose types that check against Perl syntax"
arch=('any')
url='http://search.cpan.org/dist/MooseX-Types-Perl'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-moosex-types' 'perl-params-util')


options=('!emptydirs')

source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/MooseX-Types-Perl-$pkgver.tar.gz")
md5sums=('28ce385b35f8ef9ef696a42ea358f7fb')

build() {
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
    MODULEBUILDRC=/dev/null

  DIST_DIR="${srcdir}/MooseX-Types-Perl-$pkgver"
  {
	cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

