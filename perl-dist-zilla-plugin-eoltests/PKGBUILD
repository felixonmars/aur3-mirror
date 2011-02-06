# CPAN Name  : Dist-Zilla-Plugin-EOLTests
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-eoltests/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-eoltests'
pkgver='0.02'
pkgrel='1'
pkgdesc="Release tests making sure correct line endings are used"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-EOLTests'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla' 'perl-moose' 'perl-namespace-autoclean' 'perl-test-eol')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Dist-Zilla-Plugin-EOLTests-0.02.tar.gz')
md5sums=('894aa7c305c54d31f29e4523f8de8af4')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-EOLTests-0.02"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  {
	cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

}

