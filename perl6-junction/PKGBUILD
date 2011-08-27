# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.17
pkgname='perl6-junction'
pkgver='1.40000'
pkgrel='1'
pkgdesc="Perl6 style Junction operators in Perl5."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Perl6-Junction'
source=('http://search.cpan.org/CPAN/authors/id/C/CF/CFRANKS/Perl6-Junction-1.40000.tar.gz')
md5sums=('0d94cc39ac646175ad38451ef752e982')

build() {
  DIST_DIR="${srcdir}/Perl6-Junction-1.40000"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
