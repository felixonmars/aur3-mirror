# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.17
pkgname='perl-b-debug'
pkgver='1.12'
pkgrel='1'
pkgdesc="print debug info about ops"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/B-Debug'
source=('http://search.cpan.org/CPAN/authors/id/R/RU/RURBAN/B-Debug-1.12.tar.gz')
md5sums=('ae1016ece5937cadcd97e5f353fedee4')

build() {
  DIST_DIR="${srcdir}/B-Debug-1.12"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
