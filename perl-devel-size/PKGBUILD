# CPAN Name  : Devel-Size
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.18
pkgname='perl-devel-size'
pkgver='0.79'
pkgrel='1'
pkgdesc="Report amount of memory a variable uses"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-extutils-makemaker>=6.56')
url='http://search.cpan.org/dist/Devel-Size'
source="http://search.cpan.org/CPAN/authors/id/N/NW/NWCLARK/Devel-Size-${pkgver}.tar.gz"
md5sums=('d171491fecb093336644a5244f089b70') 

build() {
  DIST_DIR="${srcdir}/Devel-Size-${pkgver}"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&make test &&
    make DESTDIR="$pkgdir" install;  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
