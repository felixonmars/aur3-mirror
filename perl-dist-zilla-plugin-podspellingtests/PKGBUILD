# CPAN Name  : Dist-Zilla-Plugin-PodSpellingTests
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.02
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-podspellingtests/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-podspellingtests'
pkgver='1.101420'
pkgrel='1'
pkgdesc="Release tests for POD spelling"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-PodSpellingTests'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla' 'perl-moose' 'perl-pod-wordlist-hanekomu' 'perl-test-spelling')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARCEL/Dist-Zilla-Plugin-PodSpellingTests-1.101420.tar.gz')
md5sums=('c6de27977833a9f3c5f409033fc712ed')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-PodSpellingTests-1.101420"
  export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1
  {
	cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

