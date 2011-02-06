# CPAN Name  : String-Strip
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.18
pkgname='perl-string-strip'
pkgver='1.01'
pkgrel='1'
pkgdesc="xs Module to remove white-space from strings"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/String-Strip'
source=('http://search.cpan.org/CPAN/authors/id/B/BP/BPOWERS/String-Strip-1.01.tar.gz')
md5sums=('a1471ad67dbb7375dd0d288026ee7122')

build() {
  DIST_DIR="${srcdir}/String-Strip-1.01"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
