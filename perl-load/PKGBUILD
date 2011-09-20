# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-load'
pkgver='0.20'
pkgrel='1'
pkgdesc="load - control when subroutines will be loaded"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/load'
source=('http://search.cpan.org/CPAN/authors/id/E/EL/ELIZABETH/load-0.20.tar.gz')
md5sums=('63016e026213a642147f39ef6fe2f98a')

build() {
  _DISTDIR="${srcdir}/load-0.20"
  export PERL_MM_USE_DEFAULT=1
  { cd "$_DISTDIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -delete
  find "$pkgdir" -name perllocal.pod -delete
}
