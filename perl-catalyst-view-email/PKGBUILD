# CPAN Name  : Catalyst-View-Email
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-catalyst-view-email/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-catalyst-view-email'
pkgver='0.30'
pkgrel='1'
pkgdesc="Send Email from Catalyst"
arch=('any')
url='http://search.cpan.org/dist/Catalyst-View-Email'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-authen-sasl>=2.13' 'perl-catalyst-runtime>=5.7' 'perl-email-mime>=1.859' 'perl-email-sender>=0.100110' 'perl-moose>=0.93' 'perl-test-requires')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/D/DH/DHOSS/Catalyst-View-Email-0.30.tar.gz')
md5sums=('934404858bacdb0a79fe56c32c5bf890')

build() {
  DIST_DIR="${srcdir}/Catalyst-View-Email-0.30"
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

