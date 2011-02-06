# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.16
pkgname='perl-file-fetch'
pkgver='0.24'
pkgrel='1'
pkgdesc="Generic file fetching code"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/File-Fetch'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/File-Fetch-0.24.tar.gz')
md5sums=('4c1dadfc0f7428414b247a5ef55a6778')

build() {
  _DISTDIR="${srcdir}/File-Fetch-0.24"
  export PERL_MM_USE_DEFAULT=1
  { cd "$_DISTDIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
