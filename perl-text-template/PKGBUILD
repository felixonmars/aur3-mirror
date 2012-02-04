# CPAN Name  : Text-Template
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.20
# Template @ http://github.com/xenoterracide/AURpan/blob/master/perl-text-template/PKGBUILD.tt
# File bugs @ http://github.com/xenoterracide/AURpan/issues

pkgname='perl-text-template'
pkgver='1.45'
pkgrel='2'
pkgdesc="Expand template text with embedded perl"
arch=('any')
url='http://search.cpan.org/dist/Text-Template'
license=('PerlArtistic' 'GPL')
depends=('perl')

options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/M/MJ/MJD/Text-Template-1.45.tar.gz')
md5sums=('cd22441c1ab0870c012225c9a585e262')

build() {
  DIST_DIR="${srcdir}/Text-Template-1.45"
  export PERL_MM_USE_DEFAULT=1
  {
	cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

