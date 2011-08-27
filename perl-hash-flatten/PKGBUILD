# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.16
pkgname='perl-hash-flatten'
pkgver='1.16'
pkgrel='1'
pkgdesc="flatten/unflatten complex data hashes"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-log-trace' 'perl-test-assertions')
url='http://search.cpan.org/dist/Hash-Flatten'
source=('http://search.cpan.org/CPAN/authors/id/B/BB/BBC/Hash-Flatten-1.16.tar.gz')
md5sums=('b67a1b1888aee862bd5b7a2987989495')

build() {
  _DISTDIR="${srcdir}/Hash-Flatten-1.16"
  export PERL_MM_USE_DEFAULT=1
  { cd "$_DISTDIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
