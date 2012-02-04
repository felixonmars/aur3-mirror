# CPAN Name  : Dist-Zilla-Plugin-KwaliteeTests
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.02
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-kwaliteetests/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-kwaliteetests'
pkgver='1.101420'
pkgrel='1'
pkgdesc="Release tests for kwalitee"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-KwaliteeTests'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla' 'perl-moose' 'perl-test-kwalitee')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARCEL/Dist-Zilla-Plugin-KwaliteeTests-1.101420.tar.gz')
md5sums=('afaaa4ed6f7d535d82aaed8321b881d9')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-KwaliteeTests-1.101420"
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

