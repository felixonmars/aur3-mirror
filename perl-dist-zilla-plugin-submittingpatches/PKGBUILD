# CPAN Name  : Dist-Zilla-Plugin-SubmittingPatches
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-submittingpatches/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-submittingpatches'
pkgver='0.03'
pkgrel='1'
pkgdesc="Add SubmittingPatches documentation"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-SubmittingPatches'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.004' 'perl-dist-zilla' 'perl-moose' 'perl-namespace-autoclean')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/X/XE/XENO/Dist-Zilla-Plugin-SubmittingPatches-0.03.tar.gz')
md5sums=('01a970540d6885e37466e9dce1099fb0')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-SubmittingPatches-0.03"
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

