# CPAN Name  : ANSIColor
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.20
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-ansicolor/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-ansicolor'
pkgver='3.00'
pkgrel='2'
pkgdesc="Color output using ANSI escape sequences"
arch=('any')
url='http://search.cpan.org/dist/ANSIColor'
license=('PerlArtistic' 'GPL')
depends=('perl')

options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/R/RR/RRA/ANSIColor-3.00.tar.gz')
md5sums=('2e664f0f10c32480ee226b7bc1f68389')

build() {
  DIST_DIR="${srcdir}/ANSIColor-3.00"
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

