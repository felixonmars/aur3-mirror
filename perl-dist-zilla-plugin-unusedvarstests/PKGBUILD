# CPAN Name  : Dist-Zilla-Plugin-UnusedVarsTests
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.02
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-unusedvarstests/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-unusedvarstests'
pkgver='1.100860'
pkgrel='1'
pkgdesc="Release tests for unused variables"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-UnusedVarsTests'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla' 'perl-moose' 'perl-test-vars')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARCEL/Dist-Zilla-Plugin-UnusedVarsTests-1.100860.tar.gz')
md5sums=('da8136271d6495d7172900d207993368')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-UnusedVarsTests-1.100860"
  export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1 \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"
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

