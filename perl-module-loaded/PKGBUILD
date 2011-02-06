# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.17
pkgname='perl-module-loaded'
pkgver='0.06'
pkgrel='1'
pkgdesc="Mark modules as loaded/unloaded"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Module-Loaded'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Module-Loaded-0.06.tar.gz')
md5sums=('0a0bb1915828b73bb07f9b5239c5b976')

build() {
  DIST_DIR="${srcdir}/Module-Loaded-0.06"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
