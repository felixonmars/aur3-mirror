# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.16
pkgname='perl-math-bigrat'
pkgver='0.24'
pkgrel='1'
pkgdesc="Arbitrary size rational numbers (fractions)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-extutils-makemaker>=6.56')
url='http://search.cpan.org/dist/Math-BigRat'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LETO/Math-BigRat-0.24.tar.gz')
md5sums=('509495c1d8ff51bf9f4f120a1bf426d7')

build() {
  _DISTDIR="${srcdir}/Math-BigRat-0.24"
  export PERL_MM_USE_DEFAULT=1
  { cd "$_DISTDIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
