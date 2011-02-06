# CPAN Name  : Dist-Zilla-Plugin-Prepender
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-prepender/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-prepender'
pkgver='1.101590'
pkgrel='1'
pkgdesc="prepend lines at the top of your perl files"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-Prepender'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla' 'perl-moose' 'perl-moosex-has-sugar' 'perl-path-class')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/J/JQ/JQUELIN/Dist-Zilla-Plugin-Prepender-1.101590.tar.gz')
md5sums=('34318992976adf8a1dfbea7f1331adad')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-Prepender-1.101590"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  {
	cd "$DIST_DIR" &&
    perl Build.PL --installdirs=vendor --destdir="$pkgdir" &&
    perl Build &&
    perl Build test &&
    perl Build install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

}

