# CPAN Name  : Template-ShowStartStop
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-template-showstartstop/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-template-showstartstop'
pkgver='0.22'
pkgrel='1'
pkgdesc="Display where templates start and stop"
arch=('any')
url='http://search.cpan.org/dist/Template-ShowStartStop'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.004' 'perl-super' 'perl-template-toolkit')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/X/XE/XENO/Template-ShowStartStop-0.22.tar.gz')
md5sums=('c6c777198d2145df81f1974feafeb112')

build() {
  DIST_DIR="${srcdir}/Template-ShowStartStop-0.22"
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

