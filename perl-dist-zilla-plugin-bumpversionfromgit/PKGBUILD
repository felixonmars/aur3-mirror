# CPAN Name  : Dist-Zilla-Plugin-BumpVersionFromGit
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-bumpversionfromgit/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-bumpversionfromgit'
pkgver='0.007'
pkgrel='1'
pkgdesc="provide a version number by bumping the last git release tag"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-BumpVersionFromGit'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla' 'perl-file-copy-recursive' 'perl-file-pushd' 'perl-git-wrapper' 'perl-moose' 'perl-namespace-autoclean>=0.09' 'perl-path-class' 'perl-version-next')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Dist-Zilla-Plugin-BumpVersionFromGit-0.007.tar.gz')
md5sums=('4ab70460a089470ebc5b060366ebee3f')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-BumpVersionFromGit-0.007"
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

