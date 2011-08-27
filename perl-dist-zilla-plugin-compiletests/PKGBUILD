# CPAN Name  : Dist-Zilla-Plugin-CompileTests
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-compiletests/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-compiletests'
pkgver='1.101800'
pkgrel='1'
pkgdesc="common tests to check syntax of your modules"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-CompileTests'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla' 'perl-moose')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/J/JQ/JQUELIN/Dist-Zilla-Plugin-CompileTests-1.101800.tar.gz')
md5sums=('ec6a0c4e1f3e831d2c453e303030b973')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-CompileTests-1.101800"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  {
	cd "$DIST_DIR" &&
    perl Build.PL &&
    perl Build &&
    perl Build test &&
    perl Build install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

}

