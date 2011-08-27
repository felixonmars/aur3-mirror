# CPAN Name  : Dist-Zilla-Plugin-Bugtracker
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.04
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-dist-zilla-plugin-bugtracker/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-dist-zilla-plugin-bugtracker'
pkgver='1.101490'
pkgrel='1'
pkgdesc="Automatically sets the bugtracker URL"
arch=('any')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-Bugtracker'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dist-zilla' 'perl-moose')


options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARCEL/Dist-Zilla-Plugin-Bugtracker-1.101490.tar.gz')
md5sums=('df438fbfb8e6d864b861585fccb41ad8')

build() {
  DIST_DIR="${srcdir}/Dist-Zilla-Plugin-Bugtracker-1.101490"
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

