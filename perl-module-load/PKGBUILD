# CPAN Name  : Module-Load
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.18
pkgname='perl-module-load'
pkgver='0.18'
pkgrel='1'
pkgdesc="Load modules in a DWIM style"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Module-Load'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Module-Load-0.18.tar.gz')
md5sums=('3c8b06ecccef2741167e5dd4bd1e0095')

build() {
  DIST_DIR="${srcdir}/Module-Load-0.18"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
