# CPAN Name  : Dist-Zilla-Plugin-PerlTidy
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-perltidy/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-perltidy'
pkgver='0.09'
pkgrel='1'
pkgdesc="PerlTidy in Dist::Zilla"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-PerlTidy'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla>=2.100880' 'perl-file-next' 'perl-tidy')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Dist-Zilla-Plugin-PerlTidy-0.09.tar.gz')
md5sums=('ca5b13727ab9133522d40bebd93fff8b')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-PerlTidy-0.09"
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

